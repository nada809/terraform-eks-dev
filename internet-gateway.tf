resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.eks-dev-vpc.id

  tags = {
    Name        = "demo-dev-igw"
    Environment = "development"

  }
}
