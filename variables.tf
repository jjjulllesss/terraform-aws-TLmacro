variable "aws_az" {
  description = "AWS availability zone to launch servers."
  default     = ""
}

variable "vpc_name" {
  description = "Name of the existing VPC which will be used"
  default     = ""
}

variable "instance_type" {
  description = "Type of instance used (API name)"
  default     = "c5a.4xlarge"
}

variable "sg_name" {
  description = "Name of the security group"
  default     = "sg_live"
}

variable "project_name" {
  description = "Name of the project for tags"
  default     = "TitanLive"
}

variable "root_storage" {
  description = "Quantity of storage for root disk"
  default     = 30
}

variable "user_names" {
  description = "Name and number of instances to create (if you specify multiple names)"
  default     = ["TitanLive"]
}

variable "TL_majorVersion" {
  description = "First digit of Titan Live version"
  default     = 4
}

variable "TL_minorVersion" {
  description = "Second digit of Titan Live version"
  default     = 1
}

variable "TL_GAVersion" {
  description = "Third digit of Titan Live version"
  default     = 22
}

variable "TL_fixVersion" {
  description = "Fourth digit of Titan Live version"
  default     = 0
}

variable "streamport" {
  description = "Port used for input stream"
  default     = 1234
}