output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "private_endpoint_ip" {
  value = azurerm_private_endpoint.endpoint.private_ip_address
}

output "key_vault_id" {
  value = azurerm_key_vault.vault.id
}

output "customer_managed_key_id" {
  value = azurerm_key_vault_key.key.id
}
