variable "aws_region" {
  description = "Region for the VPC"
  default = "eu-central-1"
}

variable "aws_region_az_public" {
  description = "az for the public-subnet"
  default = "eu-central-1b"
}
variable "aws_region_az_privat" {
  description = "az for the private-subnet"
  default = "eu-central-1c"
}
variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "Amazon Linux 2 AMI (HVM), SSD Volume Type"
  default = {
    eu-central-1 = "ami-0eaec5838478eb0ba"
    # us-east-1 = ""
  }
}
variable "ami_autoscale" {
  description = "AMI id for auscaling group"
default = "ami-0eaec5838478eb0ba"
}

variable "ssh_keypair" {
  description = "SSH key for auscalin group"
  default = "terra-aws19"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "~/key/terra-aws19"
}


# variable "key_path" {
#   description = "SSH Public Key path"
#   default = "/home/core/.ssh/id_rsa.pub"
# # }
# variable "ssh_key_name" {
#   ssh_key_name = "vtraida-18key"
  
# }
