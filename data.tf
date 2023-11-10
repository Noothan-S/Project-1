
# Get reference to local Azure client
data "azurerm_client_config" "current" {}

# Terraform User
data "azuread_client_config" "current" {}
