// variables

variable "region" {
  default = "ap-south-1"
  type = string
  description = "mumbai region"
}

variable "ec2_map" {
  type = map(object({
      ami = string
      type = string
  }))
  default = {
    "ubuntu" = {
      ami : "ami-02b8269d5e85954ef"
      type : "t2.nano"
    }

    "amazon-linux" = {
        ami : "ami-0305d3d91b9f22e84"
        type : "t3.micro"
    }
  }
}