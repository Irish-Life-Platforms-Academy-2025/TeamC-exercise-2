resource "azurerm_resource_group" "sql" {
  name     = "${var.prefix}-SQL-RG"
  location = var.default_region
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "${var.prefix}-sqlserver"
  resource_group_name          = azurerm_resource_group.sql.name
  location                     = azurerm_resource_group.sql.location
  version                      =  var.SQL_Version
  administrator_login          =  var.sql_username
  administrator_login_password =  var.sql_password
}

resource "azurerm_sql_database" "sql_database" {
  name                = "${var.prefix}-sqldb"
  resource_group_name = azurerm_resource_group.sql.name
  location            = azurerm_resource_group.sql.location
  server_name         = azurerm_sql_server.sql_server.name
  sku_name            = var.SQL_Azure_SKU
}

resource "azurerm_resource_group" "sql_geo" {
  name     = "${var.prefix}-SQL-GEO-RG"
  location = var.geo_region
}

resource "azurerm_sql_server" "sql_server_geo" {
  name                         = "${var.prefix}-sqlserver-geo"
  resource_group_name          = azurerm_resource_group.sql_geo.name
  location                     = azurerm_resource_group.sql_geo.location
  version                      = var.SQL_Version
  administrator_login          =  var.sql_username
  administrator_login_password =  var.sql_password
}

resource "azurerm_sql_database" "sql_database_geo" {
  name                = "${var.prefix}-sqldb-geo"
  resource_group_name = azurerm_resource_group.sql_geo.name
  location            = azurerm_resource_group.sql_geo.location
  server_name         = azurerm_sql_server.sql_server_geo.name
  sku_name            = var.SQL_Azure_SKU
}
