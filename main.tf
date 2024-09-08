module "storage_account" {
  source                    = "./modules/storage-account"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  allowed_subnet_ids         = var.allowed_subnet_ids
  allowed_ip_ranges          = var.allowed_ip_ranges
  private_endpoint_subnet_id = var.private_endpoint_subnet_id
  environment                = var.environment
}
