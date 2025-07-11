variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-xxxxxxxxxxxxx"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default    = "keyname"
}

variable "tags_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "sample"
}

variable "env" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "billing_name" {
  description = "Billing tag"
  type        = string
  default     = "mobile"
}

provider "aws" {
  region = "us-west-1"
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["external-1c"]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["launch-wizard-6"]
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  key_name               = var.key_name

  tags = {
    Name        = var.tags_name
    Environment = var.env
    Billing     = var.billing_name
  }
}