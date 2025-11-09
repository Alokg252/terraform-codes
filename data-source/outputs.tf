output "name" {
  value = "Hello World"
}

output "data_ami" {
  value = data.aws_ami.data.id
}

output "security_group" {
  value = data.aws_security_group.data
}

output "caller_name" {
  value = data.aws_caller_identity.data
}