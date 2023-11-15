# Terraform Block
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.65.0"
    }

    # Here it is optional/Use when random string required
    # Use when Alphanumeric for Key vault required 
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.40.0"
    }
  }
}


# Resource Group 
# Random String using with Key Valut for name
# App Owner
# App Registrations
# Service Principal
# App Registration Password
# Service Principal Password
# Role Assignment
# Key Vault
# Give local client access to key vault
# Store Service Principal client ID and secret in Key Vault


# Resource Group 
resource "azurerm_resource_group" "power_bi_rg" {
  name     = "${local.project_name}-${var.resource_group_name}"
  location = var.resource_group_location
  tags = {
    environment = "dev"
    project     = "novigo-power-bi"
  }
}


# Random String using with Key Valut for name
resource "random_string" "power_bi_random" {
  length  = var.random_string_length
  upper   = var.random_string_upper
  special = var.random_string_special
}


# App Owner
data "azuread_user" "power_bi_owner" {
  user_principal_name = var.owner_username
}

# App Registrations
resource "azuread_application" "power_bi_app" {
  display_name = var.azuread_application_display_name
  owners       = local.app_owner
  # lifecycle {
  #   prevent_destroy = true
  # }


  required_resource_access {
    resource_app_id = "00000009-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # Tenant.Read.All
      type = "Role"
    }

    resource_access {
      id   = "1bfefb4e-e0b5-418b-a88f-73c46d2cc8e9" # Tenant.ReadWrite.All
      type = "Role"
    }
  }
}


# Service Principal
resource "azuread_service_principal" "power_bi_principal" {
  client_id                    = azuread_application.power_bi_app.client_id
  app_role_assignment_required = var.azuread_service_principal_app_role_assignment_required
  owners                       = local.app_owner
}


# App Registration Password
resource "time_rotating" "power_bi_app_passowrd_time" {
  rotation_days = var.time_rotating_rotation_days
}

resource "azuread_application_password" "power_bi_app_password" {
  display_name = var.azuread_application_password_display_name
  # application_object_id = azuread_application.power_bi_app.id
  application_id = azuread_application.power_bi_app.id
  rotate_when_changed = {
    rotation = time_rotating.power_bi_app_passowrd_time.id
  }

}

# Service Principal Password
resource "time_rotating" "power_bi_sp_password_time" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "power_bi_sp_password" {
  display_name         = var.azuread_service_principal_password_display_name
  service_principal_id = azuread_service_principal.power_bi_principal.object_id
  rotate_when_changed = {
    rotation = time_rotating.power_bi_sp_password_time.id
  }
}


# Role Assignment
resource "azurerm_role_assignment" "power_bi_role_assignment" {
  role_definition_name = var.azurerm_role_assignment_role_definition_name
  principal_id         = azuread_service_principal.power_bi_principal.id
  scope                = azurerm_resource_group.power_bi_rg.id
}


# Key Vault
# Create Key Vault
resource "azurerm_key_vault" "power_bi_kv" {
  name                        = var.azurerm_key_vault_name
  location                    = azurerm_resource_group.power_bi_rg.location
  resource_group_name         = azurerm_resource_group.power_bi_rg.name
  enabled_for_disk_encryption = var.azurerm_key_vault_enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.azurerm_key_vault_soft_delete_retention_days
  purge_protection_enabled    = var.azurerm_key_vault_purge_protection_enabled
  sku_name                    = var.azurerm_key_vault_sku_name
  tags = {
    environment = "dev"
    project     = "novigo-power-bi"
  }
}


# Give local client access to key vault
resource "azurerm_key_vault_access_policy" "power_bi_kv_policy" {
  key_vault_id = azurerm_key_vault.power_bi_kv.id
  object_id    = data.azurerm_client_config.current.object_id
  # object_id = azuread_application.power_bi_app.object_id
  tenant_id = data.azurerm_client_config.current.tenant_id

  # key_permissions = var.azurerm_key_vault_access_policy.key_permissions
  # secret_permissions = var.azurerm_key_vault_access_policy.secret_permissions

  secret_permissions = var.azurerm_key_vault_access_policy_secret_permissions

}

# Store Service Principal Application Client ID and Secret in Key Vault
resource "azurerm_key_vault_secret" "power_bi_app_client_id" {
  name         = var.azurerm_key_vault_secret_power_bi_app_client_id_name
  value        = azuread_application.power_bi_app.client_id
  key_vault_id = azurerm_key_vault.power_bi_kv.id

  depends_on = [
    azurerm_key_vault_access_policy.power_bi_kv_policy
  ]
}

resource "azurerm_key_vault_secret" "power_bi_app_client_secret" {
  name         = var.azurerm_key_vault_secret_power_bi_app_client_secret_name
  value        = azuread_application_password.power_bi_app_password.value
  key_vault_id = azurerm_key_vault.power_bi_kv.id

  depends_on = [
    azurerm_key_vault_access_policy.power_bi_kv_policy
  ]
}


/*

  # Assign admin consent
  require_admin_approval = true



provisioner "local-exec" {
      command = "az ad app permission admin-consent --id ${azuread_application.power_bi_app.client_id}"
    }
}


# Grant admin consent
resource "null_resource" "admin_consent" {
  triggers = {
    enterprise_app_id = azuread_application.example.client_id
  }

  provisioner "local-exec" {
    command = <<EOT
      az rest --method POST --uri https://graph.microsoft.com/v1.0/servicePrincipals/${azuread_service_principal.example.object_id}/grantConsent
    EOT
  }
}


# next step after permission added
resource "null_resource" "grant_api_permissions" {
  provisioner "local-exec" {
    command = "az ad app permission grant --id 1b19e805-4c09-4670-9dd0-f5805ce6c69b --api 00000009-0000-0000-c000-000000000000"
  }
}

*/
