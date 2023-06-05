terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-west-2"

}

## Terraform backend configuration for state locking

terraform {
  backend "s3" {
    bucket         = "tfstate-buckets"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-locking-table"
  }
}

