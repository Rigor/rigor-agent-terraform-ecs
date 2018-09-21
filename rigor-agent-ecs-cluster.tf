resource "aws_ecs_cluster" "rigor-agents" {
  name = "${var.ecs_cluster}"
}
