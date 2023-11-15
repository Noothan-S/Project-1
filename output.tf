# Output Values
# Client ID
output "Aplication_id" {
  value = azuread_application.power_bi_app.client_id
}

# Tenant ID
output "Tenant_Id" {
  value = data.azuread_client_config.current.tenant_id
}

# Client Secret
output "Client_Secret" {
  sensitive = true
  value     = azuread_service_principal_password.power_bi_sp_password.value
}
# App Object ID
output "App_Object_Id" {
  value = azuread_application.power_bi_app.object_id
}



# output "my_tenant_id" {
#   value = data.azuread_client_config.current.tenant_id
# }

# output "app_client_secret" {
#   value     = azuread_application_password.power_bi_app_password.value
#   sensitive = true
# }

# output "app_app_id" {
#   value = azuread_application.power_bi_app.application_id
# }



# output "sp_client_secret" {
#   value     = azuread_service_principal_password.power_bi_sp_password.value
#   sensitive = true
# }

# output "sp_app_id" {
#   value = azuread_service_principal.power_bi_principal.application_id
# }

# output "sp_object_id" {
#   value = azuread_service_principal.power_bi_principal.object_id
# }