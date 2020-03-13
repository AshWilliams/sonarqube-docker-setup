output "sql_server_fqdn" {
  value = azurerm_sql_server.shared.fully_qualified_domain_name
}

output "database_name" {
  value = azurerm_sql_database.shared.name
}

output "connection_string" {
  description = "Connection string for the Azure SQL Database created."
  value       = "jdbc:sqlserver://${azurerm_sql_server.shared.fully_qualified_domain_name}:1433;database=s${azurerm_sql_database.shared.name};user=${var.SQLUser}@sql-sonarqube-shared-andresi;password=${var.SQLPassword};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"
}