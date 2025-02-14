# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

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

# Public VMs
resource "azurerm_network_interface" "public_vm_nic_1" {
  name                = "TEAMC-publicVMNic1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public_subnet_1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "public_vm_nic_2" {
  name                = "TEAMC-publicVMNic2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public_subnet_2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "public_vm_nic_3" {
  name                = "TEAMC-publicVMNic3"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public_subnet_3.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "public_vm_1" {
  name                  = "TEAMC-publicVM1"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.public_vm_nic_1.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "TEAMC-publicOSDisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TEAMC-publicvm1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "public_vm_2" {
  name                  = "TEAMC-publicVM2"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.public_vm_nic_2.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "TEAMC-publicOSDisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TEAMC-publicvm2"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "public_vm_3" {
  name                  = "TEAMC-publicVM3"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.public_vm_nic_3.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "TEAMC-publicOSDisk3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TEAMC-publicvm3"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# Private VMs
resource "azurerm_network_interface" "private_vm_nic_1" {
  name                = "TEAMC-privateVMNic1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private_subnet_1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "private_vm_nic_2" {
  name                = "TEAMC-privateVMNic2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private_subnet_2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "private_vm_nic_3" {
  name                = "TEAMC-privateVMNic3"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private_subnet_3.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "private_vm_1" {
  name                  = "TEAMC-privateVM1"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.private_vm_nic_1.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "TEAMC-privateOSDisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TEAMC-privatevm1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "private_vm_2" {
  name                  = "TEAMC-privateVM2"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.private_vm_nic_2.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "TEAMC-privateOSDisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TEAMC-privatevm2"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "private_vm_3" {
  name                  = "TEAMC-privateVM3"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.private_vm_nic_3.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "TEAMC-privateOSDisk3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "TEAMC-privatevm3"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

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