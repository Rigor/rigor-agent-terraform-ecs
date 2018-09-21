variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "region" {}

variable "asg_max_instance_count" {}
variable "asg_min_instance_count" {}
variable "asg_desired_instance_count" {}

variable "subnet_id" {}
variable "rigor_agent_key" {}
variable "security_group_id" {}