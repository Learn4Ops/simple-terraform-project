This project indicates examples of postgres,aks and cr terraform codes. Purpose of creating this repository is completly experimentel.


If you want to deploy and test this configuration just follow the related steps:

**Prerequests for this hands-on**

* az-cli

* terraform

* bash


Let's quickly start  create resource group and storage account via azure cli!

**Steps**

```

$ az login (Privilged account will be needed)

```

I really like to use environment variables. So if you want to change name of anything, just do it, actually you might want to change accname for unique name rule.

```

$ rg=simple-project-rg && loc=westeurope && accname=sasimple27x13 && container=simpleterraform

$ az group create -n $rg -l westeurope

$ az storage account create -n $accname -g $rg -l $loc --sku Standard_RAGRS --kind StorageV2

$ az storage container create -n $container --account-name $accname

```

Finally storage account created, we need to pass variables to use that storage account.

```

$ terraform init \
      -backend-config="resource_group_name=$rg" \
      -backend-config="storage_account_name=$accname" \
      -backend-config="container_name=$container" \
      -backend-config="key=terraform.tfstate"

```

You can also edit testing.tfvars or you can create it from scratch and use your own tfvars file.

```

$ terraform apply -var-file=testing.tfvars --auto-approve

```

Clear everything

```

$ terraform destroy -var-file=testing.tfvars --auto-approve

$ az group delete -n $rg -y

```
