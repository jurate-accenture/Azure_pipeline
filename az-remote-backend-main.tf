# Generate a random storage name
resource "random_string" "tf-name" {
  length  = 15  # Limit the length directly to 15 characters
  upper   = false
  numeric = true
  lower   = true
  special = false
}

# Create a Storage Account for the Terraform State File
resource "azurerm_storage_account" "state-sta" {
  depends_on               = [azurerm_resource_group.state-rg]
  name = "${lower(replace(var.company, "[^a-z0-9]", ""))}tfr${random_string.tf-name.result}"
  resource_group_name      = azurerm_resource_group.state-rg.name
  location                 = azurerm_resource_group.state-rg.location
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
