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

provider "azurerm" {
  features {


    cognitive_account {
      purge_soft_delete_on_destroy = true
    }

    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    log_analytics_workspace {
      permanently_delete_on_destroy = true
    }



    resource_group {
      prevent_deletion_if_contains_resources = true
    }

 
    template_deployment {
      delete_nested_items_during_deletion = true
    }

    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }

    virtual_machine_scale_set {
      force_delete                  = false
      roll_instances_when_required  = true
      scale_to_zero_before_deletion = true
    }
  }
}