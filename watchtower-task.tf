resource "aws_ecs_task_definition" "watchtower" {
  family = "watchtower"

  volume {
    host_path = "/var/run/docker.sock"
    name = "docker-sock"
  }

  container_definitions = <<EOF
[{
    "name": "watchtower",
    "image": "v2tec/watchtower",
    "memory": 32,
    "essential": true,
    "command": [
        "--label-enable",
        "--cleanup"
    ],
    "mountPoints": [
        {
            "sourceVolume": "docker-sock",
            "containerPath": "/var/run/docker.sock",
            "readOnly": false
        }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.watchtower.name}",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs"
      }
  }
}]
  EOF
}