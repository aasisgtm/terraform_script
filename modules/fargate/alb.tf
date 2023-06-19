## APllication Load Balancer

resource "aws_lb" "application_load_balancer" {
  name               = "${var.app_name}-alb-${terraform.workspace}"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [aws_security_group.lb.id]

  tags = {
    Name    = var.name
    Creator = var.creator
    Project = var.project
  }
}

## Target group for ALB

resource "aws_lb_target_group" "hello_world" {
  name        = "${var.app_name}-tgt-group-${terraform.workspace}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "60"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/v1/status"
    unhealthy_threshold = "2"
  }

}

##Listener rule for ALB

resource "aws_lb_listener" "hello_world" {
  load_balancer_arn = aws_lb.application_load_balancer.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.hello_world.id
    type             = "forward"
  }
}

## Security Group for ALB

resource "aws_security_group" "lb" {
  name   = "${var.app_name}-alb-sg-${terraform.workspace}"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}