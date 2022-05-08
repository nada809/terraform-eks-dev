resource "aws_eip" "nat1" {
  
  depends_on = [aws_internet_gateway.dev-igw]

  tags = {
    Name        = "demo-dev-eip-nat"
    Environment = "development"

  }
}



resource "aws_nat_gateway" "eks-dev-nat-gw-1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.eks-dev-vpc-public-eu-central-1a.id

  tags = {
    Name        = "demo-dev-nat-gateway-eu-central-1a"
    Environment = "development"

  }

}


