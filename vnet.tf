# Defines an Azure Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-VNET"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vms.location
  resource_group_name = azurerm_resource_group.vms.name
}

# Defines an Azure Subnet within the Virtual Network
resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-SUBNET"
  resource_group_name  = azurerm_resource_group.vms.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}