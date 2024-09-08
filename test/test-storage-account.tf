provider "azurerm" {
  features {}
}

module "test_storage_account" {
  source                    = "../modules/storage-account"
  resource_group_name        = "test-rg"
  location                   = "West Europe"
  storage_account_name       = "teststorageaccount"
  allowed_subnet_ids         = []
  allowed_ip_ranges          = ["10.0.0.0/24"]
  private_endpoint_subnet_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx/subnets/xxx"
  environment                = "development"
  log_analytics_workspace_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.OperationalInsights/workspaces/xxx"
}
