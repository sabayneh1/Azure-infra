

resource "azurerm_resource_group" "rg2" {
  name     = var.rg2
  location = var.location
}

resource "azurerm_resource_group" "linux_rg2" {
  name     = var.rg2
  location = var.location
}

resource "azurerm_resource_group" "win_rg2" {
  name     = var.rg2
  location = var.location
}

