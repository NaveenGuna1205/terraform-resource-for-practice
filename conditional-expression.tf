// this file is for practicing conditional expression in terraform. 
// Conditional expressions are used to assign a value to a variable based on a condition. In this example, we are using a conditional expression to assign the instance type of an AWS EC2 instance based on the environment and region variables. If the environment is "prod" and the region is "ap-south-1", the instance type will be "t2.large". Otherwise, it will be "t2.micro".
// syntax of conditional expression is: condition ? true_value : false_value

variable "environment" {
  type    = string
  default = "prod"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

resource "aws_instance" "example" {
  instance_type = var.environment == "prod" && var.region == "ap-south-1" ? "t2.large" : "t2.micro"
  ami          = "ami-0c55b159cbfafe1f0"
}