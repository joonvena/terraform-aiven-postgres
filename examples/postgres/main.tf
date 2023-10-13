module "postgres" {
  source = "../../"

  aiven_project = var.aiven_project
  database_name = var.database_name
  pg_version    = var.pg_version
}
