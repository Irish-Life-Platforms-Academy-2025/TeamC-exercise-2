
resource "azurerm_resource_group" "sql" {
  name     = "${var.prefix}-SQL-RG"
  location = var.default_region
}

resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                = "${var.postgreesql_prefix}-postgresqlserver"
  resource_group_name = azurerm_resource_group.sql.name
  location            = azurerm_resource_group.sql.location
  administrator_login = "pgadmin"
  administrator_password = var.admin_password
  version             = "12"
  sku_name            = "B_Standard_B1ms"

  storage_mb = 32768

  backup_retention_days = 7
  geo_redundant_backup_enabled = true

  high_availability {
    mode = "ZoneRedundant"
  }

  public_network_access_enabled = true
}

resource "azurerm_postgresql_flexible_server_database" "postgresql_database" {
  name                = "${var.prefix}-pgdb"
  server_id           = azurerm_postgresql_flexible_server.postgresql_server.id
  charset             = "UTF8"
  
}

resource "azurerm_resource_group" "sql_geo" {
  name     = "${var.prefix}-SQL-GEO-RG"
  location = var.geo_region
}

resource "azurerm_postgresql_flexible_server" "postgresql_server_geo" {
  name                = "${var.postgreesql_prefix}postgresqlserver-geo"
  resource_group_name = azurerm_resource_group.sql_geo.name
  location            = azurerm_resource_group.sql_geo.location
  administrator_login = "pgadmin"
  administrator_password = var.admin_password
  version             = "12"
  sku_name            = "B_Standard_B1ms"

  storage_mb = 32768

  backup_retention_days = 7
  geo_redundant_backup_enabled = true

  high_availability {
    mode = "ZoneRedundant"
  }

  public_network_access_enabled = true
}

resource "azurerm_postgresql_flexible_server_database" "postgresql_database_geo" {
  name                = "${var.prefix}-pgdb-geo"
  server_id           = azurerm_postgresql_flexible_server.postgresql_server_geo.id
  charset             = "UTF8"
  
}