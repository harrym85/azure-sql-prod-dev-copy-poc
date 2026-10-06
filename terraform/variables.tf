variable "prod_subscription_id" {
  description = "Production Azure subscription ID"
  type        = string
}

variable "dev_subscription_id" {
  description = "Development Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region for the PoC"
  type        = string
  default     = "South Africa North"
}

variable "sql_admin_login" {
  description = "SQL administrator login"
  type        = string
  default     = "sqlpocadmin"
}

variable "sql_admin_password" {
  description = "SQL administrator password"
  type        = string
  sensitive   = true
}