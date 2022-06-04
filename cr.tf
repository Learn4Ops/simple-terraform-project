resource "azurerm_resource_group" "cr-rg" {
  name     = var.cr-rg-name
  location = var.location
}

resource "random_string" "random" {
  length  = 4
  upper   = false
  lower   = true
  number  = true
  special = false
}


locals {
  cr_name = "${var.environment}${var.cr-name}${random_string.random.result}"
}

resource "azurerm_container_registry" "acr" {
  name                = local.cr_name
  location            = azurerm_resource_group.cr-rg.location
  resource_group_name = azurerm_resource_group.cr-rg.name
  sku                 = var.cr-sku
  admin_enabled       = var.cr-admin
}