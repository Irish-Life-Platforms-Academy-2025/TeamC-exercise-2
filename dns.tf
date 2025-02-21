# Defines an Azure DNS Zone
resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_hostname
  resource_group_name = azurerm_resource_group.dns.name
}
