provider "azurerm" {
  features {}
  client_id       = "a0bfd4da-05b0-4206-9cfb-93123f51b327"
  client_secret   = "91c49883-8ad6-4508-906b-48c3ea7d98ff"
  subscription_id = "168b5162-e625-42f1-994a-dfcfff0433bb"
  tenant_id       = "857209b0-65c3-4e9c-b000-fb0787ed18e7"

}

data "azurerm_client_config" "current" {}