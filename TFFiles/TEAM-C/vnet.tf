# Create a public VNet with 3 subnets
resource "azurerm_virtual_network" "public_vnet" {
  name                = "TEAMC-PublicVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "public_subnet_1" {
  name                 = "TEAMC-PublicSubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.public_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "public_subnet_2" {
  name                 = "TEAMC-PublicSubnet2"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.public_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "public_subnet_3" {
  name                 = "TEAMC-PublicSubnet3"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.public_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# Create a private VNet with 3 subnets
resource "azurerm_virtual_network" "private_vnet" {
  name                = "TEAMC-PrivateVNet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "private_subnet_1" {
  name                 = "TEAMC-PrivateSubnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "private_subnet_2" {
  name                 = "TEAMC-PrivateSubnet2"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = ["10.1.2.0/24"]
}

resource "azurerm_subnet" "private_subnet_3" {
  name                 = "TEAMC-PrivateSubnet3"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = ["10.1.3.0/24"]
}