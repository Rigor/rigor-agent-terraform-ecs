resource "aws_cloudwatch_log_group" "rigor-agent" {
  name = "/ecs/rigor-agent"
  retention_in_days = 30
}