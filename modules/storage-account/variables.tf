variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "storage_account_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "allowed_ip_ranges" {
  type    = list(string)
  default = []
}

variable "allowed_subnet_ids" {
  type = list(string)
}

variable "private_endpoint_subnet_id" {
  type = string
}
