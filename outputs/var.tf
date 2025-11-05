// variables

variable "region" {
  default = "ap-south-1"
  type = string
  description = "mumbai region"
}

// if value not provided then asks on runtime as input
variable "security_group_name" {
    description = "which security group you want ?"
    # default = "Minocular-Bastion"
    type = string
}