// do actions here with input variables
resource "aws_vpc" "name" {
  cidr_block = var.vpc_config.cidr_block
  tags = {
    Name = var.vpc_config.name
  }
}