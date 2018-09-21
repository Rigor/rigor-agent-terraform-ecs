resource "aws_ecs_service" "rigor-agent-service" {
  name            = "rigor-agent"
  cluster         = "${aws_ecs_cluster.rigor-agents.id}"
  task_definition = "${aws_ecs_task_definition.rigor-agent.arn}"
  desired_count   = 1
}