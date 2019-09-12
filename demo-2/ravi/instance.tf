// Resouce that repesents the SSH key.
resource "aws_key_pair" "ec2Key" {
  key_name = "ec2Key"
  public_key = file(var.PUBLIC_KEY_LOC)
}

resource "aws_instance" "instance-with-nginx" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
  // This will configure the ec2 instance to use the public SSH key
  key_name = aws_key_pair.ec2Key.key_name

  // Copy script.sh into /tmp dire of the EC@ instance
  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  // Execute the script remotly
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  // Setup ssh connection using the private SSH key
  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    user = var.INSTANCE_USER
    private_key = file(var.PRIVATE_KEY_LOC)
  }
}