# This will set up an autoscale group that very closely mirrors how AWS
# sets up ECS clusters with their wizard.

# You can use any EC2 instance or a spot fleet, as long as the corect IAM role and
# AMI is used and the user data is intact.

resource "aws_autoscaling_group" "rigor-agents" {
  # Using the launch config name here ensures that changes to the launch configuration re-creates the ASG
  # Without this, changes to the launch configuration will not replace the running instnaces.
  name = "${var.ecs_cluster} Docker Hosts - ${aws_launch_configuration.rigor-agents.name}"
  max_size = "${var.asg_max_instance_count}"
  min_size = "${var.asg_min_instance_count}"
  desired_capacity = "${var.asg_desired_instance_count}"
  launch_configuration = "${aws_launch_configuration.rigor-agents.id}"
  # TODO: modify this to place hosts in multiple subnets/availability-zones
  vpc_zone_identifier = ["${var.subnet_id}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key = "Name"
    value = "${var.ecs_cluster}-Host"
    propagate_at_launch = true
  }
}

# Get the correct AMI here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
# TODO: Auto lookup the latest AMI
resource "aws_launch_configuration" "rigor-agents" {
  image_id = "${data.aws_ami.ecs_ami.id}"
  instance_type = "m5.large"
  iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.id}"
  security_groups = ["${var.security_group_id}"]
  spot_price = "0.0960"

  lifecycle {
    create_before_destroy = true
  }

  # This is standard configuration for the ECS agent
  user_data = <<EOF
  #!/bin/bash
echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
  EOF
}