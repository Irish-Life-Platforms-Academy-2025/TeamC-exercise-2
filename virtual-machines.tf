# Defines an Azure Windows Virtual Machine (VM1)
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

# Defines an Azure Windows Virtual Machine (VM2)
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

# Defines an Azure Network Interface (NIC1)
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

# Defines an Azure Network Interface (NIC2)
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