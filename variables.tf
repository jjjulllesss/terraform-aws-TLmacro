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

variable "tags" {
  type = object({
    owner        = string
    project_name = string
    officehours  = string
  })
  default = {
    owner        = "myAWSname"
    project_name = "TitanLive"
    officehours  = "ParisOfficehours"
  }
}

variable "root_storage" {
  description = "Quantity of storage for root disk"
  default     = 30
}

variable "instance_names" {
  description = "Name and number of instances to create (if you specify multiple names)"
  default     = ["TitanLive"]
}

variable "TL_Version" {
  type = object({
    major = number
    minor = number
    GA    = number
    fix   = number
  })
  default = {
    major = 4
    minor = 1
    GA    = 22
    fix   = 0
  }
}

variable "streamport" {
  type = object({
    max = number
    min = number
  })
  default = {
    max = 1234
    min = 1234
  }
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = ""
}

variable "harbor_credentials_username" {
  description = "username of the Harbor hub"
  #sensitive = true //only in terraform 14
}

variable "harbor_credentials_password" {
  description = "username of the Harbor hub"
  #sensitive = true //only in terraform 14
}