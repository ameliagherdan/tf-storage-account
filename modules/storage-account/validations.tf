variable "storage_account_name" {
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
  validation {
    condition     = var.environment == "production" || var.environment == "staging" || var.environment == "development"
    error_message = "The environment must be one of 'production', 'staging', or 'development'."
  }
}
