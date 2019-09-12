provider "aws" {
  // These details are be configured in CLI and terra can just mention the user name here...
  access_key = ""
  secret_key = ""
  region = "us-east-2"
}

resource "aws_instance" "my-first-instance" {
  ami = "ami-07e26819c90e50327"
  instance_type = "t2.micro"
}