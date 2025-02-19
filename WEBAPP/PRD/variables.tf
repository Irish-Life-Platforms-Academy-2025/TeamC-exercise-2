
#Global

variable "prefix" {
  description = "The prefix for the resource names"
  type        = string
  default     = "TEAMC-PRD"
}

variable "postgreesql_prefix" {
  description = "The prefix for the resource names"
  type        = string
  default     = "teamc-prd"
}

variable "dns_hostname" {
  description = "The DNS hostname for the environment"
  type        = string
  default     = "teamcPRD.com"
}

variable "vm_Azure_size" {
  description = "The size of the virtual machines"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "default_region" {
  description = "Sets the Default Region"
  type        = string
  default     = "uksouth"
}

variable "geo_region" {
  description = "Sets the Default Region"
  type        = string
  default     = "germanywestcentral"
}

#Credentials
variable "admin_username" {
  description = "The admin username for the virtual machines"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machines"
  type        = string
  sensitive = true
}


variable "sql_username" {
  description = "The admin username for the virtual machines"
  type        = string
  default     = "sqladmin"
}

variable "sql_password" {
  description = "The admin password for the virtual machines"
  type        = string
  sensitive = true
}

#SQL Details
variable "SQL_Version" {
    description = "Defines theversion of SQL server"
    type = string
    default = "12"
  
}
variable "SQL_Azure_SKU" {
    description = "Defines the SQL Server SKU"
    type = string
    default = "S1"
  
}

#VM OS Details
variable "imagePublisher" {
    description = "OS Image Oublusher"
    type = string
    default = "MicrosoftWindowsServer"
  
}
variable "imageOffer" {
    description = "OS Image Offer"
    type = string
    default = "WindowsServer" 
}
variable "imageSKU" {
    description = "OS Image SKU"
    type = string
    default = "2022-Datacenter"
  
}

variable "imageVersion"{
    description = "OS image Version"
    type = string
    default = "latest"

}
variable "OS_Azure_Disc" {
    description = "Defines the OS Disc Size used"
    type = string
    default = "Standard_LRS"
  
}

variable "OS_Azure_Caching" {
    description = "Defines the caching method of the disc"
    type = string
    default = "ReadWrite"
  
}

#Various Azure SKUs
variable "AzureRM_CDN_SKU" {
    description = "Defines the SKU for CDN"
    type = string
    default = "Standard_Microsoft"
  
}
variable "AzureKeyVault_SKU" {
    type = string
    default = "standard"
  
}
variable "Azure_PublicIP_SKU" {
    type = string
    default = "Standard"
  
}