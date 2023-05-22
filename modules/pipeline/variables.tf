variable "vpc_id" {
    type = string
    description = "VPC ID used to create subnet"
}

variable "environment" {
    type = string
    description = "Name ot the stage/environment i.e. dev, qa, uat or prod"
    default = "dev"
}

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
    default     = "aasis"
    description = "Tag for name"
}

variable "github_repo_owner" {
    type = string
    default = "aashishgautam"
    description = "Github's owner name"
}

variable "github_repo_name" {
    type = string
    default = "express-app"
    description = "Github Repository name"
}

variable "github_branch" {
    type = string
    default = "main"
    description = "Github branch used for application"
}

variable "cluster_name" {
    type = string
    description = "Name of the ECS cluster"
}

variable "service_name" {
    type = string
    description = "Name of the ECS service"
}

variable "s3_bucket" {
    type = string
    description = "Name of the s3 bucket"
}