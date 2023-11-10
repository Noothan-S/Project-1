# Variables
# Local Variables 
variable "project_name" {
  type        = string
  description = "A prefix used for all resources in this project (incl. dashes). Required."

  validation {
    condition     = length(var.project_name) < 30
    error_message = "Name must be less than 30 characters."
  }
}

variable "suffix" {
  type        = string
  description = "Suffix to avoid automation errors on Azure resources that require globally unique names. Defaults to empty string."
  default     = ""
}


# Variables for Resource Group
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "power_bi_resource_group"
}

variable "resource_group_location" {
  type        = string
  description = "location of the resource group"
  default     = "East US"

}


# Variables for Random String
variable "random_string_length" {
  description = "Random String for Unique ID"
  type        = string
  default     = "16"
}

variable "random_string_upper" {
  description = "Using Uppercase Letters for ID"
  type        = bool
  default     = false
}

variable "random_string_special" {
  description = "Using Special characters for ID"
  type        = bool
  default     = false
}


# App Owner
variable "owner_username" {
  type        = string
  description = "Specifies the user principal name (UPN) associated with the app owner in Azure AD"
}


# Variables for App Registrations
variable "azuread_application_display_name" {
  type        = string
  description = "Name of the Web Application"
  default     = "My_App_Registartion"
}
/*
# ----not required----
variable "azuread_application_owners" {
  type        = string
  description = "Owners of the App Registration"
  default     = local.app_owner
}
*/

# Variables for Service Principal
variable "azuread_service_principal_app_role_assignment_required" {
  type        = bool
  description = "App Role Assignment Requirement"
  default     = false
}

/*
# ----not required----
variable "azuread_service_principal_owners" {
  type = string
  description = "Owners of the App Registration"
  default     = local.app_owner
}
*/


# Variables for App Registration Password
variable "time_rotating_rotation_days" {
  type    = number
  default = 7
}

variable "azuread_application_password_display_name" {
  type    = string
  default = "Terraform_Generated_App_Password"
}


# Variables for Service Principal Password
# Already mentioned in line.101
# variable "time_rotating_rotation_days" {
#   type = number
#   default = 7
# }

variable "azuread_service_principal_password_display_name" {
  type    = string
  default = "Terraform_Generated_SP_Password"
}

# Variables for Role Assignment
variable "azurerm_role_assignment_role_definition_name" {
  type    = string
  default = "Contributor"
}



# Variables Key Vault
variable "azurerm_key_vault_name" {
  type        = string
  description = "Key Valut Name"
  default     = "Valid-Name-123"
}

variable "azurerm_key_vault_enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "azurerm_key_vault_soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "azurerm_key_vault_purge_protection_enabled" {
  type    = bool
  default = false
}

variable "azurerm_key_vault_sku_name" {
  type    = string
  default = "standard" # or "premium"
}

# Variable to Give local client access to key vault
variable "azurerm_key_vault_access_policy_secret_permissions" {
  type    = list(string)
  default = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
}

# # Variable to Give local client access to key vault
# variable "azurerm_key_vault_access_policy_key_permissions" {
#   type    = list(string)
#   default = ["Create", "Get"]
# }

# # Variable to Give local client access to key vault
# variable "azurerm_key_vault_access_policy_secret_permissions" {
#   type    = list(string)
#   default = ["Get", "Set", "Delete", "Recover", "Purge"]
# }


# Variables for Storing Service Principal client ID and secret in Key Vault
# variable "azurerm_key_vault_secret_power_bi_app_client_id" {
variable "azurerm_key_vault_secret_power_bi_app_client_id_name" {
  type    = string
  default = "power-bi-app-client-id"
}

# azurerm_key_vault_secret_power_bi_app_client_id_name

# variable "azurerm_key_vault_secret_power_bi_app_client_secret_id" {
# var.azurerm_key_vault_secret_power_bi_app_client_secret_name
variable "azurerm_key_vault_secret_power_bi_app_client_secret_name" {
  type    = string
  default = "power-bi-app-client-secret"
}

variable "my_subscription_id" {
  type = string
}

/*
variable "app_app_id" {
  type = string
}

variable "app_client_secret" {
  type = string
}

variable "my_tenant_id" {
  type = string
}
*/