// outputs

// log myserver's public ip
output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip
}

// log my_website's endpoint
output "aws_s3_bucket_static_website_endpoint" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}