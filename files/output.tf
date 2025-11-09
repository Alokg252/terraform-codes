output "user_data" {
  value = local.user_data
}

output "iam_users" {
  value = aws_iam_user.users
}

output "user_data_pair" {
  value = local.user_data_pair
}