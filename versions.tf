terraform {
    required_version = ">= 1.0.0"
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = ">=2.0"
      }
    }
    backend "azurerm" {                               #Simple Remote Backend Storage
    resource_group_name  = "myrg-1"
    storage_account_name = "beginnerscwaqu"
    container_name       = "vhds"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  numeric = false
}