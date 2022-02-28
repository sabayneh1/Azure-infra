terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-n01516507-rg"
    storage_account_name = "tfstaten01516507sa"
    container_name       = "tfstatefiles"
    key                  = "lab.terraform.tfstate"
  }
}