# resource "aws_subnet" "public_subnet1" {
#   vpc_id     = var.vpc_id
#   cidr_block = var.cidr_public1

#   tags = {
#     Name = var.name
#     Project = var.project
#     Creator = var.creator
#   }
# }

resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnet_config
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name    = "${var.private_name}-${each.key}"
    Project = var.project
    Creator = var.creator
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name    = var.private_name
    Project = var.project
    Creator = var.creator
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}