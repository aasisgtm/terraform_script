variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR bolck used for VPC"
}

variable "project" {
  type        = string
  default     = "devops"
  description = "Tag for project"
}

variable "creator" {
  type        = string
  default     = "aashish"
  description = "Tag for project"
}

variable "name" {
  type        = string
  default     = "aashish-vpc"
  description = "Tag for project"
}

variable "instance_tenancy" {
  type        = string
  description = "Tenancy option for instances launched inside the VPC"
  default     = "default"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Boolean value to enable/disable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Boolean value to enable/disable DNS support in the VPC"
  default     = true
}