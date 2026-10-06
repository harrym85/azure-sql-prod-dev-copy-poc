#
# PROD
#

resource "azurerm_resource_group" "prod" {
  provider = azurerm.prod

  name     = "rg-sql-copy-prod-poc"
  location = var.location

  tags = {
    Environment = "Prod"
    Purpose     = "Azure-SQL-Cross-Subscription-Copy-PoC"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_mssql_server" "prod" {
  provider = azurerm.prod

  name                         = "sql-blusky-prod-copy-poc"
  resource_group_name          = azurerm_resource_group.prod.name
  location                     = azurerm_resource_group.prod.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  minimum_tls_version = "1.2"

  tags = {
    Environment = "Prod"
    Purpose     = "Azure-SQL-Cross-Subscription-Copy-PoC"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_mssql_database" "prod" {
  provider = azurerm.prod

  name      = "DemoProdDB"
  server_id = azurerm_mssql_server.prod.id

  sku_name    = "Basic"
  max_size_gb = 2

  tags = {
    Environment = "Prod"
    Purpose     = "Azure-SQL-Cross-Subscription-Copy-PoC"
    ManagedBy   = "Terraform"
  }
}


#
# DEV
#

resource "azurerm_resource_group" "dev" {
  provider = azurerm.dev

  name     = "rg-sql-copy-dev-poc"
  location = var.location

  tags = {
    Environment = "Dev"
    Purpose     = "Azure-SQL-Cross-Subscription-Copy-PoC"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_mssql_server" "dev" {
  provider = azurerm.dev

  name                         = "sql-blusky-dev-copy-poc"
  resource_group_name          = azurerm_resource_group.dev.name
  location                     = azurerm_resource_group.dev.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  minimum_tls_version = "1.2"

  tags = {
    Environment = "Dev"
    Purpose     = "Azure-SQL-Cross-Subscription-Copy-PoC"
    ManagedBy   = "Terraform"
  }
}