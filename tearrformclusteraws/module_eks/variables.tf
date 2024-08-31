

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.24"
}

variable "vpc_id" {
  description = "VPC ID where the cluster and nodes will be created"
  type        = string
  default     = "vpc-0532cc35649634df9"
}

variable "subnet_ids" {
  description = "List of subnets where EKS nodes will be deployed"
  type        = list(string)
  default     = ["subnet-03f3cd99a48a2db7c", "subnet-001a3b80bd44fbbd4"]
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type for the worker nodes"
  type        = string
  default     = "t3.medium"
}


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "EKS"
  }
}
