# Defines an Azure Public IP for the Load Balancer
resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${var.prefix}-LB-PUBLICIP"
  resource_group_name = azurerm_resource_group.lb.name
  location            = azurerm_resource_group.lb.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Defines an Azure Load Balancer
resource "azurerm_lb" "load_balancer" {
  name                = "${var.prefix}-LB"
  location            = azurerm_resource_group.lb.location
  resource_group_name = azurerm_resource_group.lb.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}