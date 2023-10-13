variable "aiven_project" {
  description = "Aiven project name"
  type        = string
}

variable "database_name" {
  description = "Name of the database"
  type        = string
}

variable "pg_version" {
  description = "PostgreSQL version"
  type        = string
  validation {
    condition     = can(regex("^(12|13|14|15)$", var.pg_version))
    error_message = "Invalid PostgreSQL version"
  }
}

variable "allowed_ips" {
  description = "List of allowed IPs"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
