## Elastic Container Repository for our node app

resource "aws_ecr_repository" "aws_ecr" {
  name = "${var.app_name}-${var.environment}-ecr"
  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }
}

