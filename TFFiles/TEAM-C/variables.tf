# Define variables
variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The location of the resources"
}

variable "admin_username" {
  description = "The admin username for the VMs"
}

variable "admin_password" {
  description = "The admin password for the VMs"
}