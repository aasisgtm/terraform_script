variable "vpc_id" {
  type        = string
  description = "VPC ID used to create subnet"
}

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
  default     = "aasis-${terraform.workspace}"
  description = "Tag for name"
}

variable "github_repo_owner" {
  type        = string
  default     = "aasisgtm"
  description = "Github's owner name"
}

variable "github_repo_name" {
  type        = string
  default     = "express-app"
  description = "Github Repository name"
}

variable "github_branch" {
  type        = string
  default     = "master"
  description = "Github branch used for application"
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "s3_bucket" {
  type        = string
  description = "Name of the s3 bucket"
}