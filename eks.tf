resource "aws_iam_role" "cluster-role" {
  name = "demo-dev-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster-role.name
}

resource "aws_eks_cluster" "demo-dev-eks" {
  name     = "demo-dev-eks"
  version  = "1.22"
  role_arn = aws_iam_role.cluster-role.arn


  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.eks-dev-vpc-private-eu-central-1a.id,
      aws_subnet.eks-dev-vpc-private-eu-central-1b.id,
      aws_subnet.eks-dev-vpc-private2-eu-central-1b.id,
      aws_subnet.eks-dev-vpc-public-eu-central-1a.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.amazon_eks_cluster_policy]
}
