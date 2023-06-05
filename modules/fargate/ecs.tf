## ECS Cluster

resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-${var.environment}-cluster"

  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }
}



## ECS Task Definition

resource "aws_ecs_task_definition" "aws_first_task" {
  family                   = "${var.app_name}-first-task" # Naming our first task
  container_definitions    = <<DEFINITION
  [
    {
      "name": "${var.app_name}-first-task",
      "image": "${aws_ecr_repository.aws_ecr.repository_url}",
      "essential": true,
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.log-group.id}",
          "awslogs-region": "${var.aws_region}",
          "awslogs-stream-prefix": "${var.app_name}-${var.environment}"
        }
      },
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 3000
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn


  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }
}


# ## ECS Service

resource "aws_ecs_service" "my_service" {
  name            = "my-first-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.aws_first_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.hello_world.arn
    container_name   = aws_ecs_task_definition.aws_first_task.family
    container_port   = 3000
  }

  network_configuration {
    subnets          = tolist(var.public_subnet_ids)
    assign_public_ip = true
    security_groups  = ["${aws_security_group.service_security_group.id}"]
  }

  depends_on = [aws_lb_listener.hello_world]

  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }

}


resource "aws_security_group" "service_security_group" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = ["${aws_security_group.lb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
