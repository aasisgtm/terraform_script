# resource "aws_subnet" "public_subnet1" {
#   vpc_id     = var.vpc_id
#   cidr_block = var.cidr_public1

#   tags = {
#     Name = var.name
#     Project = var.project
#     Creator = var.creator
#   }
# }

# Define a locals block to generate a list of tag names with the unique count for each public subnet
# locals {
#   public_subnet_tags = [
#     for idx, subnet in var.public_subnet_config : "${var.public_name}-${idx + 1}"
#   ]
# }

resource "aws_subnet" "public_subnets" {
  for_each          = var.public_subnet_config
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name    = "${var.public_name}-${each.key}"
    Project = var.project
    Creator = var.creator
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name    = var.public_name
    Project = var.project
    Creator = var.creator
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw-id
}

resource "aws_route_table_association" "public_subnet_association" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}