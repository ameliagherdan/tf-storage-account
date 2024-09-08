variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  validation {
    condition     = length(var.storage_account_name) <= 24 && length(var.storage_account_name) >= 3
    error_message = "The storage account name must be between 3 and 24 characters."
  }
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.storage_account_name))
    error_message = "The storage account name must only contain lowercase letters and numbers."
  }
}

variable "environment" {
  description = "The environment (production, staging, or development)"
  type        = string
  validation {
    condition     = var.environment == "production" || var.environment == "staging" || var.environment == "development"
    error_message = "The environment must be one of 'production', 'staging', or 'development'."
  }
}

variable "allowed_ip_ranges" {
  description = "A list of IP ranges allowed to access the storage account in CIDR format"
  type        = list(string)
  default     = []
}

variable "allowed_subnet_ids" {
  description = "A list of subnet IDs allowed to access the storage account"
  type        = list(string)
}

variable "private_endpoint_subnet_id" {
  description = "The ID of the subnet for the private endpoint"
  type        = string
}
