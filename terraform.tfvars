# tfvars 

my_subscription_id = "770d0357-2ecb-44fc-a363-ba14d49f0557"

project_name = "novi-neo-dev"

resource_group_name             = "rg"
resource_group_location         = "East US"
resource_group_tags_environment = "dev"

random_string_length  = "16"
random_string_upper   = false
random_string_special = false

owner_username = "sanjay@sanjaydm94outlook.onmicrosoft.com"


azuread_application_display_name = "Power BI Embeding Salesforce"

app_role_allowed_members_types = ["User", "Application"]
app_role_descrption            = "Admins can manage roles and perform all task actions"
app_role_display_name          = "Admin"
app_role_enabled               = true
app_role_id                    = "bf0e940c-71e9-4408-972e-6b6630543650"
app_role_value                 = "admin"

resource_app_id       = "00000009-0000-0000-c000-000000000000"
resource_access_id    = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
resource_access_type  = "Role"
resource_access1_id   = "1bfefb4e-e0b5-418b-a88f-73c46d2cc8e9"
resource_access1_type = "Role"

azuread_service_principal_app_role_assignment_required = true

time_rotating_rotation_days               = 7
azuread_application_password_display_name = "Terraform_Generated_App_Password"

azuread_service_principal_password_display_name = "Terraform_Generated_SP_Password"

azurerm_role_assignment_role_definition_name = "Contributor"

azurerm_key_vault_name                        = "novi-noo-kv"
azurerm_key_vault_enabled_for_disk_encryption = true
azurerm_key_vault_soft_delete_retention_days  = 7
azurerm_key_vault_purge_protection_enabled    = false
azurerm_key_vault_sku_name                    = "premium"
azurerm_key_vault_tags_environment            = "dev"

azurerm_key_vault_access_policy_secret_permissions = ["Get",
"List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]

# azurerm_key_vault_access_policy_key_permissions    = ["Create", "Get"]
# azurerm_key_vault_access_policy_secret_permissions = ["Get", "Set", "Delete", "Recover", "Purge"]


azurerm_key_vault_secret_power_bi_app_client_id_name     = "Novigo-Client-ID"
azurerm_key_vault_secret_power_bi_app_client_secret_name = "Client-Secret-ID"
