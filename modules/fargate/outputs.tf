output "repository_name" {
  description = "Name of the Elastic Container Repository"
  value       = aws_ecr_repository.aws_ecr.name
}

output "repository_url" {
  description = "URL of the Generated Elastic Container Repository"
  value       = aws_ecr_repository.aws_ecr.repository_url
}

output "alb_dns_name" {
  description = "DNS name of the Application Load balancer"
  value = aws_lb.application_load_balancer.dns_name
}

output "cluster_name" {
  description = "Name of the ECS cluster"
  value = aws_ecs_cluster.main.name
}

output "service_name" {
  description = "Name of the ECS service"
  value = aws_ecs_service.my_service.name
}