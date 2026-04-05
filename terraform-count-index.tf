// This Terraform configuration creates three AWS EC2 instances using the `count` meta-argument. 
// Each instance is tagged with a unique name that includes its index.
// count.index starts from 0, so we add 1 to it to get a more human-friendly instance name.
// count.index is a built-in variable that provides the current index of the resource being created, allowing us to create multiple instances with unique identifiers.

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "name" {
    count         = 3
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    tags = {
        Name = "Instance-${count.index + 1}"
    }  
}

//other user case

variable "developer-name" {
    type = list(string)
    default = ["alice", "bob", "charlie"]
}

resource "aws_iam_user" "lb" {
    count = 3
    name  = var.developer-name[count.index]
}