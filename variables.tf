variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "aws_az" {
  description = "AWS availability zone to launch servers."
  default     = ""
}

variable "vpc" {
  description = "Name of the existing VPC which will be used"
  default     = "Default VPC"
}

variable "instance_type" {
  description = "Type of instance used (API name)"
  default     = "c5.4xlarge"
}

variable "sg_name" {
  description = "Name of the security group"
  default     = "sg_live"
}

variable "project_name" {
  description = "Name of the project fro tags"
  default     = "TitanLive"
}

variable "root_storage" {
  description = "Quantity of storage for root disk"
  default     = 30
}

variable "user_names" {
  description = "Name and number of instances to create"
  default     = []
}

variable "private_ip" {
  description = "Name and number of instances to create"
  default     = []
}
