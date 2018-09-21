variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    us-east-1 = "us-east-1"
  }
}

variable "asg_max_instance_count" {}
variable "asg_min_instance_count" {}
variable "asg_desired_instance_count" {}

variable "subnet_id" {}
variable "ecs_ami_id" {}
variable "rigor_agent_key" {}
variable "security_group_id" {}