resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks-dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id

  }


  tags = {
    Name        = "demo-dev-public-route"
    Environment = "development"

  }
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.eks-dev-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-dev-nat-gw-1.id

  }


  tags = {
    Name        = "demo-dev-private-route-1"
    Environment = "development"
  }
}


resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.eks-dev-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-dev-nat-gw-1.id

  }

  tags = {
    Name        = "demo-dev-private-route-1"
    Environment = "development"
  }
}




resource "aws_route_table" "private3" {
  vpc_id = aws_vpc.eks-dev-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-dev-nat-gw-1.id

  }


  tags = {
    Name        = "demo-dev-private-route-2"
    Environment = "development"
  }
}





resource "aws_route_table_association" "eks-dev-vpc-private-eu-central-1a" {
  subnet_id      = aws_subnet.eks-dev-vpc-private-eu-central-1a.id
  route_table_id = aws_route_table.private1.id
}


resource "aws_route_table_association" "eks-dev-vpc-private-eu-central-1b" {
  subnet_id      = aws_subnet.eks-dev-vpc-private-eu-central-1b.id
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "eks-dev-vpc-private2-eu-central-1b" {
  subnet_id      = aws_subnet.eks-dev-vpc-private2-eu-central-1b.id
  route_table_id = aws_route_table.private3.id
}


resource "aws_route_table_association" "eks-dev-vpc-public-us-east-1a" {
  subnet_id      = aws_subnet.eks-dev-vpc-public-eu-central-1a.id
  route_table_id = aws_route_table.public.id
}


