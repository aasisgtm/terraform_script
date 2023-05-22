variable "project" {
  type        = string
  default     = "devops"
  description = "Tag for project"
}

variable "creator" {
  type        = string
  default     = "aashish"
  description = "Tag for creator"
}

variable "name" {
  type        = string
  default     = "aasis-postgres-db"
  description = "Tag for name"
}

variable "private_subnet_ids" {
  type = list(string)
  default = []
  description = "Private subnets to use"
}

variable "db_name" {
    type =  string
    default = "postgresdb"
}

variable "postgres_username" {
    type = string
    default = "postgres"
    description = "Postgres master Username"
}

variable "postgres_password" {
    type = string
    default = "postgres"
    description = "Postgres master Password"
}

variable "vpc_id" {
  type = string
  description = "VPC ID used in "
}