resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-logs-${terraform.workspace}"

  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }
}