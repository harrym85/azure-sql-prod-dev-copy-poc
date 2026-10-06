output "prod_subscription_id" {
  value = var.prod_subscription_id
}

output "dev_subscription_id" {
  value = var.dev_subscription_id
}

output "prod_sql_server_name" {
  value = azurerm_mssql_server.prod.name
}

output "prod_sql_server_fqdn" {
  value = azurerm_mssql_server.prod.fully_qualified_domain_name
}

output "prod_database_name" {
  value = azurerm_mssql_database.prod.name
}

output "dev_sql_server_name" {
  value = azurerm_mssql_server.dev.name
}

output "dev_sql_server_fqdn" {
  value = azurerm_mssql_server.dev.fully_qualified_domain_name
}