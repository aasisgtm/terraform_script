output "vpc_id" {
  value       = module.vpc.vpc-id
}

output "public_subnet_output" {
  value = module.subnets.public_subnet_ids
}

output "private_subnet_output" {
  value = module.subnets.private_subnet_ids
}

output "public_subnet_cidr_output" {
  value = module.subnets.public_subnet_cidrs
}

output "private_subnet_cidr_output" {
  value = module.subnets.private_subnet_cidrs
}

output "public_route_table_id" {
  value = module.subnets.public_route_table_id
}

output "private_route_table_id" {
  value = module.subnets.private_route_table_id
}

output "repository_name" {
  value = module.fargate.repository_name
}

output "repository_url" {
  value = module.fargate.repository_url
}

output "alb_dns" {
  value = module.fargate.alb_dns_name
}