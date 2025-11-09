locals {
  user_data = yamldecode(file("./config/config.yaml")).users
  user_data_pair = flatten([for user in local.user_data : 
                     [for role in user.roles: 
                        {
                           username = user.username 
                           role = role
                        }
                     ]
                   ])
}