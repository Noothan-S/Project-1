# Before uncommenting backend block ,First run "terraform init" 
# then run-- "sh storage.sh" in bash
# Then uncomment below block and run "terraform init -reconfigure"


terraform {
  backend "azurerm" {
    resource_group_name   = "noo-tfstate-rg"
    storage_account_name  = "nootf0012"
    container_name        = "nootfstatefiles"
    key                   = "terraform.tfstate"
  }
}