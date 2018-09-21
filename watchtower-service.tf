resource "aws_ecs_service" "watchtower" {
  name            = "Watchtower"
  cluster         = "${aws_ecs_cluster.rigor-agents.id}"
  task_definition = "${aws_ecs_task_definition.watchtower.arn}"
  scheduling_strategy = "DAEMON"
}