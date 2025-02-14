terraform {
  required_version = ">= 1.9.6"
  backend "azurerm" {
    resource_group_name  = "teamcrg"
    storage_account_name = "teamcsa"
    container_name       = "tfstate"
    key                  = "vnet-terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "168b5162-e625-42f1-994a-dfcfff0433bb"

}