// iam user creation
resource "aws_iam_user" "users" {
    count = length(local.user_data)
    name = local.user_data[count.index].username
}

resource "aws_iam_user_login_profile" "user_profiles" {
    count = length(aws_iam_user.users)
    user = aws_iam_user.users[count.index].name
    password_reset_required = true
    password_length = 12 // auto_created password can be found in terraform.tfstate

    lifecycle { // when run again ignore password re-creation etc.
      ignore_changes = [ 
        password_length,
        password_reset_required,
        pgp_key
       ]
    }
}

resource "aws_iam_user_policy_attachment" "user_policies" {
  count = length(local.user_data_pair)
  user = local.user_data_pair[count.index].username
  policy_arn = "arn:aws:iam::aws:policy/${local.user_data_pair[count.index].role}"
}