resource "aiven_pg" "main" {
  project      = var.aiven_project
  service_name = var.database_name
  cloud_name   = "aws-eu-north-1"
  plan         = "free-1-5gb"

  pg_user_config {
    pg_version = var.pg_version

    ip_filter_string = var.allowed_ips
  }
}

resource "aiven_pg_database" "main" {
  project       = aiven_pg.main.project
  service_name  = aiven_pg.main.service_name
  database_name = var.database_name
}

resource "aiven_pg_user" "main" {
  project      = aiven_pg.main.project
  service_name = aiven_pg.main.service_name
  username     = var.database_name
}

data "aiven_pg_user" "main" {
  project      = aiven_pg.main.project
  service_name = aiven_pg.main.service_name
  username     = aiven_pg_user.main.username
}
