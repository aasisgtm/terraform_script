# resource "aws_vpc" "main" {
#   cidr_block       = var.cidr_block
#   instance_tenancy = "default"

#   tags = {
#     Project = "Devops"
#     Creator = "Aashish"
#     Name = "Aashish"
#   }
# }

module vpc {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc-id
  igw-id = module.vpc.igw-id

}

module "amplify" {
  source = "./modules/amplify"
  
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc-id
  private_subnet_ids = module.subnets.private_subnet_ids
}

module "fargate" {
  source = "./modules/fargate"
  vpc_id = module.vpc.vpc-id
  public_subnet_ids = module.subnets.public_subnet_ids
}

module "pipeline" {
  source = "./modules/pipeline"
  service_name = module.fargate.service_name
  cluster_name = module.fargate.cluster_name
  s3_bucket = module.s3.s3_bucket
  vpc_id = module.vpc.vpc-id
}

module "s3" {
  source = "./modules/s3"

}

module "backend" {
  source = "./modules/backend"
}
