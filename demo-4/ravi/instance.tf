resource "aws_instance" "remote_backend" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
  count = 5
}

output "PublicDNS" {
  value = aws_instance.remote_backend[2].public_dns
}