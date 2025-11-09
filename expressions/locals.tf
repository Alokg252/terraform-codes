// Calculations, data structures and loops like python
locals {

  # Calculations
  mul = 2 * 2
  add = 2 + 2
  sub = 12 - 3
  eq = 2 != 3

  # Number List
  double_list = [for num in var.num_list : num * 2] 
  odd_num_list = [for num in var.num_list : num if num % 2 == 1]
  even_num_list = [for num in var.num_list : num if num % 2 == 0]

  # Person List
  old_persons = [for p in var.obj_list : p if p.age > 40]
  yound_persons = [for p in var.obj_list : p if p.age <= 40]

  # Maps
  map_val = [for i,j in var.str_num_map : {"key": i, "val": j}]
  double_map = {for i,j in var.str_num_map : i => j * 2}

  # combine
  person_bins = [for p in local.yound_persons : local.double_map[lower(p.name)]]

}

# Complex Practice
locals {
  str_num_list_map = {
    for i,j in var.str_num_map : i => 
        [for k in var.num_list: k * j]
  }
}

# Functions
locals {
  upper = upper(var.str)
  start = startswith(var.str, "Hello")
  split = split(var.str, " ")
  contains = contains(var.str_list, "a")
  max = max(var.num_list...)
  join = join("-", var.str_list)
}