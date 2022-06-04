resource "azurerm_resource_group" "postgres-rg" {
  name     = var.postgres-rg-name
  location = var.location
}

resource "random_string" "randompostgres" {
  length  = 2
  upper   = false
  lower   = true
  number  = true
  special = false
}

locals {
  postgres_name = "${var.postgres-name}-${var.environment}-${random_string.randompostgres.result}"
}


resource "azurerm_postgresql_server" "postgres" {
  name                = local.postgres_name
  location            = azurerm_resource_group.postgres-rg.location
  resource_group_name = azurerm_resource_group.postgres-rg.name

  administrator_login          = var.user
  administrator_login_password = var.password

  sku_name   = var.postgres-sku
  version    = var.postgres-version
  storage_mb = var.postgres-storage

  backup_retention_days = var.postgres-retention

  public_network_access_enabled    = var.postgres-network-access
  ssl_enforcement_enabled          = var.postgres-ssl-enfors
  ssl_minimal_tls_version_enforced = var.postgres-ssl-enfors-version
}