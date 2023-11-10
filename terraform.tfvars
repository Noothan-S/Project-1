# tfvars 

my_subscription_id = "770d0357-2ecb-44fc-a363-ba14d49f0557"

project_name = "novigo-power-bi"

resource_group_name     = "rg"
resource_group_location = "East US"

random_string_length  = "16"
random_string_upper   = false
random_string_special = false

owner_username = "sanjay@sanjaydm94outlook.onmicrosoft.com"


azuread_application_display_name = "Power BI Embeding Salesforce"

azuread_service_principal_app_role_assignment_required = false

time_rotating_rotation_days               = 7
azuread_application_password_display_name = "Terraform_Generated_App_Password"

azuread_service_principal_password_display_name = "Terraform_Generated_SP_Password"

azurerm_role_assignment_role_definition_name = "Contributor"

azurerm_key_vault_name                        = "novi-noo-kv"
azurerm_key_vault_enabled_for_disk_encryption = true
azurerm_key_vault_soft_delete_retention_days  = 7
azurerm_key_vault_purge_protection_enabled    = false
azurerm_key_vault_sku_name                    = "premium"

azurerm_key_vault_access_policy_secret_permissions = ["Get",
"List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]

# azurerm_key_vault_access_policy_key_permissions    = ["Create", "Get"]
# azurerm_key_vault_access_policy_secret_permissions = ["Get", "Set", "Delete", "Recover", "Purge"]


azurerm_key_vault_secret_power_bi_app_client_id_name     = "Novigo-Client-ID"
azurerm_key_vault_secret_power_bi_app_client_secret_name = "Client-Secret-ID"
