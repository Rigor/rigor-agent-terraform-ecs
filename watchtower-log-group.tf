resource "aws_cloudwatch_log_group" "watchtower" {
  name = "/ecs/watchtower"
  retention_in_days = 3
}