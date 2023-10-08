# Define Terraform provider
terraform {
  required_version = ">= 0.15"

  backend "azurerm" {
    resource_group_name  = "Terraform_pipelines"
    storage_account_name = "terraformjz177"
    container_name       = "files"
    key                  = "actions.tfstate"
  }

  required_providers {
    azurerm = {
      version = "~>2.0"
      source  = "hashicorp/azurerm"
    }
  }
}



# Define your Azure resources below
