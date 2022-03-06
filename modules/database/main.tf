resource "azurerm_postgresql_server" "post_server" {
  name                = "postgresql-6507-1"
  location            = var.location
  resource_group_name = var.rg2

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "Password1010"
  administrator_login_password = "n01516507"
  version                      = "9.6"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "database" {
  name                = "sam6507"
  resource_group_name = var.rg2
  server_name         = azurerm_postgresql_server.post_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}