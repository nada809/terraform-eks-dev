resource "aws_vpc" "eks-dev-vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name        = "demo-dev-vpc"
    Environment = "development"
  }
}
