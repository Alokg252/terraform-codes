// load dynamic data of precreated (manually or by terraform or any source) resources
data "aws_ami" "data" {
  most_recent = true
  owners = ["amazon"]
}

data "aws_security_group" "data" {
  name = var.security_group_name
}

data "aws_caller_identity" "data" {}
