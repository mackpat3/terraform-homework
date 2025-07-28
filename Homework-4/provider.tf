terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-Key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tags
}