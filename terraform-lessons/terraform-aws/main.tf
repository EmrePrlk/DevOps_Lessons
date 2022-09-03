provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

locals {
  mytag = "emre-local-name"
}


resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "emrenew"
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "emretftestt"
  tags = {
    Neme = "${local.mytag}-come from locals"
  }
}

