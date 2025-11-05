// ec2
resource "aws_instance" "myserver" {
    ami = "ami-02b8269d5e85954ef" // required
    instance_type = var.instance_type // required

    root_block_device {
      delete_on_termination = true
      volume_size = 30
      volume_type = "gp2"
    }

    tags = {
      Name = "MyServer"
    }
}