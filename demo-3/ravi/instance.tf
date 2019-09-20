resource "aws_instance" "op_attrs" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"

  # Extracts the needed attributes from the EC2 instance and runs a local script.
  # very useful to start an automation script to work on the created EC2 resource
  provisioner "local-exec" {
    command = "echo ${aws_instance.op_attrs.public_dns} >> pubdns.txt"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.op_attrs.private_ip} >> private_ip.txt"
  }
}

# This will print the public IP of EC2 instance in console after successfully creating it
output "PublicIP" {
  value = aws_instance.op_attrs.public_ip
}