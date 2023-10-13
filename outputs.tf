output "database_name" {
  value = aiven_pg_database.main.database_name
}

output "database_host" {
  value = aiven_pg.main.service_host
}

output "database_port" {
  value = aiven_pg.main.service_port
}

output "database_user" {
  value = aiven_pg_user.main.username
}

output "database_password" {
  value     = data.aiven_pg_user.main.password
  sensitive = true
}

output "database_url" {
  value     = "postgres://${aiven_pg_user.main.username}:${data.aiven_pg_user.main.password}@${aiven_pg.main.service_host}:${aiven_pg.main.service_port}/${aiven_pg_database.main.database_name}?sslmode=require"
  sensitive = true
}

output "provider" {
  value = "aiven"
}

output "engine" {
  value = "postgres"
}
