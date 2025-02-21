provider "azurerm" {
  features {}
  subscription_id = "168b5162-e625-42f1-994a-dfcfff0433bb"

}

data "azurerm_client_config" "current" {}