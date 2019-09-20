terraform {
  # This backend tells terraform to store the state in S3 bucket terraform-state-abef87 under folder terraform/one_state
  backend "s3" {
    bucket = "terraform-state-abef87"
    key = "terraform/one_state"
    region = "us-east-2"
  }
}
