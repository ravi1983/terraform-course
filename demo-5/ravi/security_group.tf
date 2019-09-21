data "aws_ip_ranges" "us_east_ec2" {
  services = ["ec2"]
  regions  = ["us-east-1"]
}

resource "aws_security_group" "from_us_east" {
  name = "from_us_east"

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    # This fails since SG rules go beynd 50
    //    cidr_blocks = data.aws_ip_ranges.us_east_ec2.cidr_blocks.
  }

  tags = {
    CreateData = data.aws_ip_ranges.us_east_ec2.create_date
    SyncToken  = data.aws_ip_ranges.us_east_ec2.sync_token
  }
}