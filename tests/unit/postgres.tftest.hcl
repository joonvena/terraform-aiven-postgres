variables {
  aiven_project = "testing"
  database_name = "testing"
  pg_version    = "13"
}

provider "aiven" {}

run "unit_test" {
  command = plan

  assert {
    condition     = aiven_pg.main.pg_user_config[0].pg_version == var.pg_version
    error_message = "PostgreSQL version was ${aiven_pg.main.pg_user_config[0].pg_version} expected ${var.pg_version}"
  }

  assert {
    condition     = aiven_pg_database.main.database_name == var.database_name
    error_message = "Database name was ${aiven_pg_database.main.database_name} expected ${var.database_name}"
  }

  assert {
    condition     = aiven_pg_user.main.username == var.database_name
    error_message = "Database user was ${aiven_pg_user.main.username} expected ${var.database_name}"
  }

  assert {
    condition     = aiven_pg.main.pg_user_config[0].ip_filter_string[0] == "0.0.0.0/0"
    error_message = "Allowed IPs should have default value of 0.0.0.0/0"
  }
}

run "input_validation" {
  command = plan

  variables {
    pg_version = "11"
  }

  expect_failures = [
    var.pg_version
  ]
}