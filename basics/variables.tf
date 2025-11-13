// variables

variable "region" {
  default = "ap-south-1"
  type = string
  description = "mumbai region"
}

variable "instance_type" {
  default = "t2.nano"
  type = string
  description = "instance type"
}

variable "bucket_name" {
  # default = "mybucket-${random_id.rand_id.hex}" # this will create unique bucket name (not working)
  default = "mybucket-tf-67"
  type = string
  description = "bucket name"
}