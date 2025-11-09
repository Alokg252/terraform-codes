output "value" {
  value = local.mul + local.sub + local.add
}

output "num_list" {
  value = local.even_num_list
}

output "person_list" {
  value = local.yound_persons
}

output "map" {
  value = local.str_num_list_map
}

output "max" {
  value = local.join
}

output "encrypt" {
  value = bcrypt(var.str)
}