# Define Terraform provider
terraform {
  required_version = ">= 1.3"

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

# Configure the Azure provider
provider "azurerm" {
  features = {
    virtual_network_peering = true
  }
}

# Define your Azure resources below
