variable "project" {
  type        = string
  default     = "devops-${terraform.workspace}"
  description = "Tag for project"
}

variable "creator" {
  type        = string
  default     = "aashish-${terraform.workspace}"
  description = "Tag for creator"
}

variable "name" {
  type        = string
  default     = "aasis-postgres-db-${terraform.workspace}"
  description = "Tag for name"
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = []
  description = "Private subnets to use"
}

variable "db_name" {
  type    = string
  default = "postgresdb-${terraform.workspace}"
}

variable "postgres_username" {
  type        = string
  default     = "postgres"
  description = "Postgres master Username"
}

variable "postgres_password" {
  type        = string
  default     = "postgres"
  description = "Postgres master Password"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID used in "
}

variable "db_subnet_group_name" {
  type = string
  default = "private-subnet-db-${terraform.workspace}"
}