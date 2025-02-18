
resource "azurerm_resource_group" "dns" {
  name     = "${var.prefix}-DNS-RG"
  location = var.default_region
}

resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_hostname
  resource_group_name = azurerm_resource_group.dns.name
}