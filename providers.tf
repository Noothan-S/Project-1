# Provider Block for Azure ACtive Directory
provider "azuread" {

}

# Provider Block for Azure Resource Manager
provider "azurerm" {
  /*
  # Use when encounter with rare case to predefining
  subscription_id = my_subscription_id
  client_id       = app_app_id
  client_secret   = app_client_secret
  tenant_id       = my_tenant_id
  */

  features {}
}
