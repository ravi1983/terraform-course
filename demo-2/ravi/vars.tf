variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIs" {
  type = map(string)
  default = {
    us-east-1 = "ami-061d18b4477ccc4e6"
    us-east-2 = "ami-07e26819c90e50327"
    us-west-1 = "ami-03677aac186a48703"
  }
}

variable "PUBLIC_KEY_LOC" {}

variable "PRIVATE_KEY_LOC" {}

variable "INSTANCE_USER" {}