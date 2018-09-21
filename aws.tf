provider "aws" {
  region     = "${var.region}"
}

data "aws_ami" "ecs_ami" {
  most_recent = true

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}
