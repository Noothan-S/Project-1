# Output Values
# Client ID
output "client_id" {
  value = azuread_application.power_bi_app.client_id
}

# Tenant ID
output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}

# Client Secret
output "client_secret" {
  sensitive = true
  value     = azuread_service_principal_password.power_bi_sp_password.value
}



output "my_tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}

output "app_client_secret" {
  value     = azuread_application_password.power_bi_app_password.value
  sensitive = true
}

output "app_app_id" {
  value = azuread_application.power_bi_app.application_id
}

output "app_object_id" {
  value = azuread_application.power_bi_app.object_id
}

output "sp_client_secret" {
  value     = azuread_service_principal_password.power_bi_sp_password.value
  sensitive = true
}

output "sp_app_id" {
  value = azuread_service_principal.power_bi_principal.application_id
}

output "sp_object_id" {
  value = azuread_service_principal.power_bi_principal.object_id
}


