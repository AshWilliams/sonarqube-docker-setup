output "DatabaseUser" {
  value = azurerm_sql_server.shared.administrator_login
}

output "DatabasePassword" {
  value = azurerm_sql_server.shared.administrator_login_password
}

output "connection_string" {
  description = "Connection string for the Azure SQL Database created."
  value       = "jdbc:sqlserver://${azurerm_sql_server.shared.fully_qualified_domain_name}:1433;database=s${azurerm_sql_database.shared.name};user=${var.SQLUser}@sql-sonarqube-shared-andresi;password=${var.SQLPassword};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"
}