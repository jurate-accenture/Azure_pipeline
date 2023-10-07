terraform {
  backend "azurerm" {
    resource_group_name   = "Terraform_pipelines"
    storage_account_name  = "terraformjz177"
    container_name        = "files"
    key                   = "terraform.tfstate"
  }
}
