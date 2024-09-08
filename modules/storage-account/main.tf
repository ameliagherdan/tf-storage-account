resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "vault" {
  name                = "${var.storage_account_name}-kv"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  network_acls {
    bypass = "AzureServices"
    default_action = "Deny"
    ip_rules = var.allowed_ip_ranges
    virtual_network_subnet_ids = var.allowed_subnet_ids
  }
}

resource "azurerm_key_vault_key" "key" {
  name         = "${var.storage_account_name}-key"
  key_vault_id = azurerm_key_vault.vault.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["encrypt", "decrypt"]
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    ip_rules                   = var.allowed_ip_ranges
    virtual_network_subnet_ids  = var.allowed_subnet_ids
  }

    blob_properties {
    delete_retention_policy {
      days = 7
    }
    versioning_enabled = true
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_private_endpoint" "endpoint" {
  name                = "${var.storage_account_name}-pe"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "storagePrivateLink"
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

resource "azurerm_security_center_subscription_pricing" "defender" {
  tier          = "Standard"
  resource_type = "StorageAccounts"
}

resource "azurerm_advanced_threat_protection" "storage_atp" {
  target_resource_id = azurerm_storage_account.storage.id
  enabled            = true
}
