variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "bastion_ami_id" {
  type        = string
  description = "AMI ID for the bastion host instance"
}

variable "bastion_instance_type" {
  type        = string
  description = "Instance type for the bastion host"
}