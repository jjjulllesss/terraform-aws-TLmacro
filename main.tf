provider "aws" {
  region = var.aws_region
}

##########################DATA##################################

#Get the VPC ID
data "aws_vpc" "selected" {
  tags = {
    Name = "${var.vpc}"
  }
}

#Get the ID of the latest ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#Get the infos concerning the VPC (CIDR)
data "aws_vpc" "example" {
  id = data.aws_vpc.selected.id
}

#########################RESSOURCES###################################

resource "aws_instance" "instance" {
  count = length(var.user_names)
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  availability_zone = var.aws_az
  vpc_security_group_ids = [aws_security_group.security_group_instance.id]
  private_ip = var.private_ip[count.index]

  #IAM role attach to the instance
  iam_instance_profile = "SSMtestJules"

  #Script to install the Titan Live macro-docker
  user_data = file("install_live.sh")

  #Primary storage of the instance
  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_storage
  }

  tags = {
    Name = var.user_names[count.index]
    Project = var.project_name
  }
}

# # # # # # # # # # # # # # Elastic IP # # # # # # # # # # # # # # #
resource "aws_eip" "elasticip" {
  count = length(var.user_names)
  vpc   = true
  tags = {
    Name = var.user_names[count.index]
    Project = var.project_name
  }
}

resource "aws_eip_association" "eip_assoc" {
  count = length(var.user_names)
  instance_id   = aws_instance.instance[count.index].id
  allocation_id = aws_eip.elasticip[count.index].id
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

resource "aws_security_group" "security_group_instance" {
  name        = var.sg_name
  description = "Allow http, ping inbound traffic. All in outbound"
  vpc_id      = data.aws_vpc.selected.id

  #Port for HTTP access  
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Port for ping inside the VPC
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [data.aws_vpc.example.cidr_block]
  }

  ingress {
    from_port   = 1234
    to_port     = 1234
    protocol    = "udp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
    Project = var.project_name
  }
}