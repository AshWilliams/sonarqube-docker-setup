output "connection_string" {
  value = module.SQLAzure.connection_string
}

output "DatabaseUser"{
  value = module.SQLAzure.DatabaseUser
} 

output "DatabasePassword" {
  value = module.SQLAzure.DatabasePassword
} 