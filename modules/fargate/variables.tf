variable "vpc_id" {
    type = string
    description = "VPC ID used to create subnet"
}

variable "public_subnet_ids" {
  type    = set(string)
  default = []    
  description = "Public subnet ids available in VPC"
}


variable "app_name" {
    type = string
    description = "Name of the application"
    default = "devops"
}

variable "aws_region" {
    type = string
    description = "Current AWS region"
    default = "us-west-2"
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