resource "aws_ecs_task_definition" "rigor-agent" {
  family = "rigor-agent"

  container_definitions = <<EOF
[{
  "name": "rigor-agent",
  "image": "docker.rigor.com/agent:stable",
  "memory": 7000,
  "essential": true,
  "environment": [{
    "name": "RUNNER_TOKEN",
    "value": "${var.rigor_agent_key}"
  }],
  "linuxParameters": {
    "capabilities": {
      "add": [
        "NET_ADMIN"
      ]
    }
  },
  "cpu": 2048,
  "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.rigor-agent.name}",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
      }
  }
}]
  EOF
}