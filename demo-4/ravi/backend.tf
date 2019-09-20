terraform {
  backend "s3" {
    bucket = "terraform-state-abef87"
    key = "terraform/one_state"
    region = "us-east-2"
  }
}