# Identify the key VPC in the account.

data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.main_vpc]
  }
}

# Assumes that private subnets are always named as private


data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*public*"]
  }
}

output "aws_vpc_id" {
  value = data.aws_vpc.main_vpc.id
}

data "aws_ami" "ubuntu-image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  # Canonical
  owners = ["099720109477"]

}


