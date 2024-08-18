variable "region" {
  description = "The AWS region to deploy the cluster"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-cluster"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnets" {
  description = "Subnets where the EKS cluster and nodes will be deployed"
  type        = list(string)
}

variable "access_key" {
    default = ""
}
variable "secret_key" {
    default = ""
}


variable "region" {
    default = "us-east-1"
}
