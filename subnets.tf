

resource "aws_subnet" "eks-dev-vpc-public-eu-central-1a" {
  vpc_id                  = aws_vpc.eks-dev-vpc.id
  cidr_block              = "172.16.48.0/20"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                    = "demo-dev-public-subnet-1a"
    "kubernetes.io/cluster/demo-dev-eks" = "shared"
    "kubernetes.io/role/elb"                  = 1
    Environment                               = "development"

  }
}




resource "aws_subnet" "eks-dev-vpc-private-eu-central-1b" {
  vpc_id            = aws_vpc.eks-dev-vpc.id
  cidr_block        = "172.16.0.0/20"
  availability_zone = "eu-central-1b"

  tags = {
    "Name"                                    = "demo-dev-private-subnet1-1b"
    Environment                               = "development"
    "kubernetes.io/cluster/demo-dev-eks" = "shared"
    "kubernetes.io/role/internal-elb"         = 1


  }
}

resource "aws_subnet" "eks-dev-vpc-private2-eu-central-1b" {
  vpc_id            = aws_vpc.eks-dev-vpc.id
  cidr_block        = "172.16.16.0/20"
  availability_zone = "eu-central-1b"

  tags = {
    "Name"                                    = "demo-dev-private-subnet2-1b"
    "kubernetes.io/cluster/demo-dev-eks" = "shared"
    Environment                               = "development"
    "kubernetes.io/role/internal-elb"         = 1




  }
}

resource "aws_subnet" "eks-dev-vpc-private-eu-central-1a" {
  vpc_id            = aws_vpc.eks-dev-vpc.id
  cidr_block        = "172.16.32.0/20"
  availability_zone = "eu-central-1a"

  tags = {
    "Name"                                    = "demo-dev-private-subnet-1a"
    "kubernetes.io/cluster/demo-dev-eks" = "shared"
    Environment                               = "development"
    "kubernetes.io/role/internal-elb"         = 1




  }
}
