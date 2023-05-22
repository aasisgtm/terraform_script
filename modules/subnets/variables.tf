variable "vpc_id" {
  type = string
  description = "VPC ID used to create subnet"
}

variable "igw-id" {
  type = string
  description = "Internet Gateway ID which the public route table will point to."
}

variable "project" {
  type        = string
  default     = "devops"
  description = "Tag for project name"
}

variable "creator" {
  type        = string
  default     = "aashish"
  description = "Tag for creator name"
}

variable "public_name" {
  type        = string
  default     = "aashish-public"
  description = "Tag for the public resource name"
}

variable "private_name" {
  type        = string
  default     = "aashish-private"
  description = "Tag for the private resource name"
}

variable "private_subnet_config" {
  default = {
    subnet1 = { cidr_block = "10.0.3.0/24", availability_zone = "us-west-2a" }
    subnet2 = { cidr_block = "10.0.4.0/24", availability_zone = "us-west-2b" }
    subnet3 = { cidr_block = "10.0.5.0/24", availability_zone = "us-west-2a" }
    subnet4 = { cidr_block = "10.0.6.0/24", availability_zone = "us-west-2b" }

  }
  # default = [
  #   { cidr_block = "10.0.3.0/24", az = "us-west-2a" },
  #   { cidr_block = "10.0.4.0/24", az = "us-west-2b" }
  # ]
  # type = list(object({
  #   cidr_block = string,
  #   az = string
  # }))
  description = "Private subnet config used in VPC"
}


variable "public_subnet_config" {
  default = {
    subnet1 = { cidr_block = "10.0.1.0/24", availability_zone = "us-west-2a" }
    subnet2 = { cidr_block = "10.0.2.0/24", availability_zone = "us-west-2b" }
  }
#   default = [
#       { cidr_block = "10.0.1.0/24", az = "us-west-2a" },
#       { cidr_block = "10.0.2.0/24", az="us-west-2b" }
#   ]
#   type = list(object({
#     cidr_block = string,
#     az = string
#   }))
  description = "Public subnet config used in VPC"
}

