# This resource block defines an Azure Resource Group for CDN (Content Delivery Network)
resource "azurerm_resource_group" "cdn" {
  name     = "${var.prefix}-CDN-RG"  
  location = "uksouth"               
}

# This resource block defines an Azure Resource Group for DNS (Domain Name System)
resource "azurerm_resource_group" "dns" {
  name     = "${var.prefix}-RG"      
  location = var.default_region      
}

# This resource block defines an Azure Resource Group for Load Balancer
resource "azurerm_resource_group" "lb" {
  name     = "${var.prefix}-RG"      
  location = var.default_region     
}

# This resource block defines an Azure Resource Group for Public IP
resource "azurerm_resource_group" "public_ip" {
  name     = "${var.prefix}-RG"      
  location = var.default_region      
}

# This resource block defines an Azure Resource Group for SQL
resource "azurerm_resource_group" "sql" {
  name     = "${var.prefix}-RG"  
  location = var.default_region      
}

# This resource block defines an Azure Resource Group for VMs
resource "azurerm_resource_group" "vms" {
  name     = "${var.prefix}-RG"
  location = var.default_region
}
