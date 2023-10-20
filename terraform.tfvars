# tfvars 

my_subscription_id = "14a730d5-6d65-487d-95e1-da4a9dc97bf9"

resource_group_name     = "power_bi_rg"
resource_group_location = "East US"

random_string_length  = "16"
random_string_upper   = false
random_string_special = false

# owner_username = "noothan@ganganoothangmail.onmicrosoft.com"
owner_username = "athul@ganganoothangmail.onmicrosoft.com"


azuread_application_display_name = "PowerBI Embeding Salesforce"

azuread_service_principal_app_role_assignment_required = true

time_rotating_rotation_days               = 7
azuread_application_password_display_name = "Terraform_Generated_App_Password"

azuread_service_principal_password_display_name = "Terraform_Generated_SP_Password"

azurerm_role_assignment_role_definition_name = "Contributor"

azurerm_key_vault_name                        = "power-bi-kv1"
azurerm_key_vault_enabled_for_disk_encryption = true
azurerm_key_vault_soft_delete_retention_days  = 7
azurerm_key_vault_purge_protection_enabled    = false
azurerm_key_vault_sku_name                    = "standard" # or "premium"

azurerm_key_vault_access_policy_secret_permissions = ["Get",
"List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]

azurerm_key_vault_secret_power_bi_app_client_id_name     = "power-bi-app-client-id"
azurerm_key_vault_secret_power_bi_app_client_secret_name = "power-bi-app-client-secret"

