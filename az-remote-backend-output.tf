output "terraform_state_resource_group_name" {
  value = azurerm_resource_group.Terraform_pipelines.name
}
output "terraform_state_storage_account" {
  value = azurerm_storage_account.terraformjz177.name
}
output "terraform_state_storage_container_core" {
  value = azurerm_storage_container.files.name
}
