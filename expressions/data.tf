terraform {}

# String
variable "str" {
  type = string
  default = "Hello World"
}


# Number List
variable "num_list" {
  type = list(number)
  default = [1,2,3,4,5]
}

# String List
variable "str_list" {
  type = list(string)
  default = ["a","b","c","d","e"]
}

# Object List
variable "obj_list" {
    type = list(object({
      name = string,
      age = number
    }))
    default = [
      { name = "A", age = 10 },
      { name = "B", age = 20 },
      { name = "C", age = 30 },
      { name = "D", age = 40 },
      { name = "E", age = 50 }
    ]
}

# Set
variable "str_set" {
  type = set(string)
  default = ["a","b","c","d","e"]
}

# Map
variable "str_num_map" {
  type = map(number)
  default = {
    "a" = 97
    "b" = 98
    "c" = 99
    "d" = 100
    "e" = 101
  }
}