resource "azurerm_resource_group" "sql" {
  name     = "${var.prefix}-RG"
  location = var.default_region
}

resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                = "${var.postgreesql_prefix}-sqlpostgresqlserver"
  resource_group_name = azurerm_resource_group.sql.name
  location            = azurerm_resource_group.sql.location
  administrator_login = "pgadmin"
  administrator_password = var.admin_password
  version             = "12"
  sku_name            = "B_Standard_B1ms"
 storage_mb = 32768
 public_network_access_enabled = true
  
}

resource "azurerm_postgresql_flexible_server_database" "postgresql_database" {
  name      = "${var.prefix}-pgdb"
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  charset   = "UTF8"
  
}