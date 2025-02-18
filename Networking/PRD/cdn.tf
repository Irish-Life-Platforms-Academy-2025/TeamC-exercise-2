resource "azurerm_resource_group" "cdn" {
  name     = "${var.prefix}-CDN-RG"
  location = var.default_region
}



resource "azurerm_cdn_profile" "cdn_profile" {
  name                = "${var.prefix}-CDN-PROFILE"
  resource_group_name = azurerm_resource_group.cdn.name
  location            = azurerm_resource_group.cdn.location
  sku                 = var.AzureRM_CDN_SKU
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = "${var.prefix}-CDN-ENDPOINT"
  profile_name        = azurerm_cdn_profile.cdn_profile.name
  resource_group_name = azurerm_resource_group.cdn.name
  location            = azurerm_resource_group.cdn.location
  origin {
    name      = "origin"
    host_name = var.dns_hostname
  }
}
