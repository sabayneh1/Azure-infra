resource "azurerm_log_analytics_workspace" "sam-assignment1" {
  name                = "sam-assignment1"
  location            = var.location
  resource_group_name = var.rg2
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "default"
  location            = var.location
  resource_group_name = var.rg2
  sku                 = "Standard"

  soft_delete_enabled = true
}

resource "azurerm_storage_account" "storage_acc" {
  name                     = "storageacc6507"
  resource_group_name      = var.rg2
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "container-6507"
  storage_account_name  = azurerm_storage_account.storage_acc.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "stor_blob" {
  name                   = "stor_blob-6507"
  storage_account_name   = azurerm_storage_account.storage_acc.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"

}

