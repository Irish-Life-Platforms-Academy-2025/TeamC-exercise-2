# Defines an Azure Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.prefix}-PUBLICIP"
  resource_group_name = azurerm_resource_group.public_ip.name
  location            = azurerm_resource_group.public_ip.location
  allocation_method   = "Static"
  sku                 = var.Azure_PublicIP_SKU
}