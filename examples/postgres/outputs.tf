output "database_name" {
  value = module.postgres.database_name
}

output "database_host" {
  value = module.postgres.database_host
}

output "database_port" {
  value = module.postgres.database_port
}

output "database_user" {
  value = module.postgres.database_user
}

output "database_password" {
  value     = module.postgres.database_password
  sensitive = true
}

output "database_url" {
  value     = module.postgres.database_url
  sensitive = true
}

output "provider" {
  value = module.postgres.provider
}

output "engine" {
  value = module.postgres.engine
}
