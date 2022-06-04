terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.2.0"
    }
  }
  required_version = "~> 1.2.0"
}

provider "azurerm" {
  features {}
}

provider "random" {
}