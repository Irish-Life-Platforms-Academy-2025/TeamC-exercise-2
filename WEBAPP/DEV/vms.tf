

resource "azurerm_resource_group" "vms" {
  name     = "${var.prefix}-VMS-RG"
  location = var.default_region
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-VNET"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vms.location
  resource_group_name = azurerm_resource_group.vms.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-SUBNET"
  resource_group_name  = azurerm_resource_group.vms.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic1" {
  name                = "${var.prefix}-NIC1"
  location            = azurerm_resource_group.vms.location
  resource_group_name = azurerm_resource_group.vms.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.prefix}-NIC2"
  location            = azurerm_resource_group.vms.location
  resource_group_name = azurerm_resource_group.vms.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm1" {
  name                = "${var.prefix}-VM1"
  location            = azurerm_resource_group.vms.location
  resource_group_name = azurerm_resource_group.vms.name
  size                = var.vm_Azure_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]
  os_disk {
    caching              = var.OS_Azure_Caching
    storage_account_type = var.OS_Azure_Disc
  }
  source_image_reference {
    publisher = var.imagePublisher
    offer     = var.imageOffer
    sku       = var.imageSKU
    version   = var.imageVersion
  }
}

resource "azurerm_windows_virtual_machine" "vm2" {
  name                = "${var.prefix}-VM2"
  location            = azurerm_resource_group.vms.location
  resource_group_name = azurerm_resource_group.vms.name
  size                = var.vm_Azure_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic2.id,
  ]
  os_disk {
   caching              =  var.OS_Azure_Caching
    storage_account_type = var.OS_Azure_Disc
  }
  source_image_reference {
    publisher = var.imagePublisher
    offer     = var.imageOffer
    sku       = var.imageSKU
    version   = var.imageVersion
  }
}
