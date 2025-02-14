# Network Security Group for Public VMs to allow SSH
resource "azurerm_network_security_group" "public_vm_nsg" {
  name                = "TEAMC-PublicVMNSG"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.0.0/16"
    destination_address_prefix = "10.0.0.0/16"
  }
}

# Network Security Group for Private VMs to allow private connectivity
resource "azurerm_network_security_group" "private_vm_nsg" {
  name                = "TEAMC-PrivateVMNSG"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "AllowPrivateConnectivity"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.0.0/16"
    destination_address_prefix = "10.1.0.0/16"
  }
}

# Associate NSGs with Network Interfaces
resource "azurerm_network_interface_security_group_association" "public_vm_nic_nsg_1" {
  network_interface_id      = azurerm_network_interface.public_vm_nic_1.id
  network_security_group_id = azurerm_network_security_group.public_vm_nsg.id
}

resource "azurerm_network_interface_security_group_association" "public_vm_nic_nsg_2" {
  network_interface_id      = azurerm_network_interface.public_vm_nic_2.id
  network_security_group_id = azurerm_network_security_group.public_vm_nsg.id
}

resource "azurerm_network_interface_security_group_association" "public_vm_nic_nsg_3" {
  network_interface_id      = azurerm_network_interface.public_vm_nic_3.id
  network_security_group_id = azurerm_network_security_group.public_vm_nsg.id
}

resource "azurerm_network_interface_security_group_association" "private_vm_nic_nsg_1" {
  network_interface_id      = azurerm_network_interface.private_vm_nic_1.id
  network_security_group_id = azurerm_network_security_group.private_vm_nsg.id
}

resource "azurerm_network_interface_security_group_association" "private_vm_nic_nsg_2" {
  network_interface_id      = azurerm_network_interface.private_vm_nic_2.id
  network_security_group_id = azurerm_network_security_group.private_vm_nsg.id
}

resource "azurerm_network_interface_security_group_association" "private_vm_nic_nsg_3" {
  network_interface_id      = azurerm_network_interface.private_vm_nic_3.id
  network_security_group_id = azurerm_network_security_group.private_vm_nsg.id
}