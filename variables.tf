variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "aws_az" {
  description = "AWS availability zone to launch servers."
  default     = "us-east-1a"
}

variable "vpc" {
  description = "Name of the existing VPC which will be used"
  default     = "Default VPC"
}

variable "instance_type" {
  description = "Type of instance used (API name)"
  default     = "c5.2xlarge"
}

variable "sg_name" {
  description = "Name of the security group"
  default     = "sg_BBCPOClive"
}

variable "project_name" {
  description = "Name of the project fro tags"
  default     = "BBCPOC"
}

variable "root_storage" {
  description = "Quantity of storage for root disk"
  default     = 30
}

variable "user_names" {
  description = "Name and number of instances to create"
  default     = ["Titan_live1"] #, "Titan_live2", "Titan_live3"]
}

variable "private_ip" {
  description = "Name and number of instances to create"
  default     = ["172.31.0.11"] #, "172.31.0.12", "172.31.0.13"]
}
