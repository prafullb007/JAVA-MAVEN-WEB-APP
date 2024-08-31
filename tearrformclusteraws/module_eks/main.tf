
module "eks_module" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.24"  # Update to your desired Kubernetes version
  subnet_ids      = ["subnet-03f3cd99a48a2db7c", "subnet-001a3b80bd44fbbd4"]  # Update to your subnets
  vpc_id          = "vpc-0532cc35649634df9"  # Update to your VPC ID

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"

      key_name = "your-keypair"  # Update to your keypair name

      additional_tags = {
        Name = "eks-node"
      }
    }
  }

  tags = {
    Environment = "dev"
    Project     = "eks-terraform"
  }
}
