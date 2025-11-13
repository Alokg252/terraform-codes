// security group

resource "aws_security_group" "firewall" {
  name = "firewall"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// ec2
resource "aws_instance" "myserver" {
    ami = "ami-02b8269d5e85954ef" // required
    instance_type = var.instance_type // required

    root_block_device {
      delete_on_termination = true
      volume_size = 30
      volume_type = "gp2"
    }

    associate_public_ip_address = false # No public IP address will be assigned
    
    depends_on = [ aws_security_group.firewall ] // forced dependency
    vpc_security_group_ids = [ aws_security_group.firewall.id ] // implied dependency

    tags = {
      Name = "MyServer"
    }

    lifecycle {
      create_before_destroy = true  # on any changes it first creates a instance with latest changes 
                                    # and then destroys previous one so that work don't get down
      prevent_destroy = true # to prevent destroying the instance
      ignore_changes = [ ami, instance_type, security_groups ] # don't update these instance prioperties
      replace_triggered_by = [ aws_security_group.firewall, aws_security_group.firewall.ingress ] # create new on these changes


      // Conditions for creation 
      precondition {
        condition = var.instance_type == "t2.nano"
        error_message = "only create instance type t2.nano"
      }

      // Conditions after creation to show error
      postcondition {
        condition = aws_security_group.firewall.region == var.region
        error_message = "security group region must be same as ec2 region"
      }

      postcondition {
        condition = self.public_ip != ""
        error_message = "public ip must be available"
      }

    }
}