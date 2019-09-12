resource "aws_instance" "my-demo1-instance" {
  ami = var.AMIs[var.AWS_REGION]
  instance_type = "t2.micro"
  tags = {
    From = "Terrafform"
    Name = "Foo" // Will be the name of the instance
  }
}