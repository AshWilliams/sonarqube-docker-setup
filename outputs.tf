output "sql_server_fqdn" {
  value = module.SQLAzure.sql_server_fqdn
}

output "database_name" {
  value = module.SQLAzure.database_name
}

output "connection_string" {
  value = module.SQLAzure.connection_string
}