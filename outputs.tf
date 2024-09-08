output "storage_account_id" {
  description = "The ID of the storage account"
  value       = module.storage_account.storage_account_id
}

output "private_endpoint_ip" {
  description = "The IP address of the private endpoint"
  value       = module.storage_account.private_endpoint_ip
}

output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = module.storage_account.key_vault_id
}

output "customer_managed_key_id" {
  description = "The ID of the customer-managed key in Key Vault"
  value       = module.storage_account.customer_managed_key_id
}
