// define variables to take input from user at root file (config.tf)
variable "vpc_config" {
  type = object({
    cidr_block = string
    name = string
  })
  description = "Enter cidr and name tag here"
}