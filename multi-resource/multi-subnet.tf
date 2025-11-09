// vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}

// subnet in vpc
resource "aws_subnet" "sub_list" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count = 2 // execute this resource block 2 times, index starts from 0 eg. 0, 1, ...
  tags = {
    Name = "Sub${count.index}"
  }
}

// 4 ec2 in 2 subnets each
resource "aws_instance" "ec2_list" {
    ami = "ami-02b8269d5e85954ef"
    instance_type = "t2.micro"
    count = 4
    subnet_id = aws_subnet.sub_list[count.index % length(aws_subnet.sub_list)].id
    tags = {
      Name = "EC2-${count.index}"
    }
}

resource "aws_instance" "ec2_for_list" {
  for_each = var.ec2_map // runs for each key,value pair in map and provides each = {key, value}
  ami = each.value.ami 
  instance_type = each.value.type
  subnet_id = aws_subnet.sub_list[index(keys(var.ec2_map), each.key) % length(aws_subnet.sub_list)].id 
  tags = {
    Name = "EC2-${each.key}"
  }
}