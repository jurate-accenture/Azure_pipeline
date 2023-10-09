

# Create a Resource Group for the Terraform State File jz
resource "azurerm_resource_group" "Terraform_pipelines" {
  name = "Terraform_pipelines"
  location = var.location
  
  lifecycle {
    prevent_destroy = true
  }  
  tags = {
    environment = var.environment
  }
}


# Create a Storage Account for the Terraform State File
resource "azurerm_storage_account" "terraformjz177" {
  depends_on               = [azurerm_resource_group.Terraform_pipelines]
  name = "terraformjz177"
  resource_group_name      = azurerm_resource_group.Terraform_pipelines.name
  location                 = azurerm_resource_group.Terraform_pipelines.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  access_tier              = "Hot"
  account_replication_type = "ZRS"
  enable_https_traffic_only = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    environment = var.environment
  }
}




# Create a Storage Container for the Core State File
resource "azurerm_storage_container" "files" {
  depends_on = [azurerm_storage_account.terraformjz177]  
  name = "files"
  storage_account_name = azurerm_storage_account.terraformjz177.name
}