resource "azurerm_resource_group" "aks-rg" {
  name     = var.aks-rg-name
  location = var.location
}

resource "random_string" "randomaks" {
  length  = 2
  upper   = false
  lower   = true
  number  = true
  special = false
}


locals {
  aks_name       = "${var.aks-name}-${var.environment}"
  aks_dns_prefix = "${var.aks-name}-${var.environment}-${random_string.randomaks.result}"
}


resource "azurerm_kubernetes_cluster" "example" {
  name                = local.aks_name
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = local.aks_dns_prefix

  default_node_pool {
    name       = var.aks-default-node-pool-name
    node_count = var.aks-default-node-pool-count
    vm_size    = var.aks-default-node-pool-size
  }

  identity {
    type = var.aks-identity
  }

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "example" {
  for_each = var.node_pools

  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = each.value.vm_size
  node_count            = each.value.node_count

  tags = {
    Environment = var.environment
  }
}