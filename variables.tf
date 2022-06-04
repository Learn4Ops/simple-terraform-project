# General Vars
variable "location" {
  default = "westeurope"
}

variable "environment" {
  default = "dev"

}


#AKS Vars
variable "aks-rg-name" {
  default = "aks-rg"
}

variable "aks-name" {
  default = "aks"
}


variable "aks-identity" {
  default = "SystemAssigned"
}


variable "aks-default-node-pool-name" {
  default = "aksdefault"
}

variable "aks-default-node-pool-count" {
  type    = number
  default = 1
}

variable "aks-default-node-pool-size" {
  type    = string
  default = "Standard_D2_v2"
}


variable "node_pools" {
  type = map(object({
    name       = string
    vm_size    = string
    node_count = number
  }))
}




#CR Vars
variable "cr-rg-name" {
  default = "cr-rg"
}

variable "cr-name" {
  default = "cr"
}

variable "cr-sku" {
  default = "Basic"
}

variable "cr-admin" {
  type    = bool
  default = false
}

#Postgres Vars
variable "postgres-rg-name" {
  default = "postgres"
}


variable "postgres-name" {
  default = "postgres"
}

variable "user" {
  default = "postgres"
}

variable "password" {
  default = "123123Aa"
}

variable "postgres-sku" {
  default = "GP_Gen5_4"
}

variable "postgres-version" {
  default = "11"
}

variable "postgres-storage" {
  default = "640000"
}

variable "postgres-retention" {
  default = "7"
}

variable "postgres-network-access" {
  type    = bool
  default = false
}

variable "postgres-ssl-enfors" {
  type    = bool
  default = true

}

variable "postgres-ssl-enfors-version" {
  type    = string
  default = "TLS1_2"
}