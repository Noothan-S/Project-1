# Output Values
# Client ID
output "Client_id" {
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