resource "aws_instance" "remote_backend" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
  security_groups = [aws_security_group.from_us_east.name]
}

output "PublicDNS" {
  value = aws_instance.remote_backend.public_dns
}