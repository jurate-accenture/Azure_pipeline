# Define Terraform provider
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "kopicloud-tfstate-rg"
    storage_account_name = "kopicloudiactest"
    container_name       = "core-tfstate"
    key                  = "actions.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}
# Configure the Azure provider
provider "azurerm" { 

 features = {
    # Enable the Virtual Network Peering feature
    virtual_network_peering { }
    
    # Enable the Managed Disks feature
    managed_disks { }
    
    # Enable the Advanced Networking features
    advanced_networking { }
  }


  }
}

