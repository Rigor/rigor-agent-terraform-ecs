This is a reference project to demonstrate the launch of Rigor agents, with supporting infrastructure, on AWS ECS using Terraform.

## Structure
This terraform project will create the following resources:
- An ECS Custer
- 2 ECS services:
    1. The Rigor Agent
    1. Watchtower DAEMON
- An Autoscaling group with launch configuration
- Cloudwatch log groups for each service
- IAM roles for ECS services and instances

Important notes:
- The autoscaling group uses `m5.large` instances (Rigor's instance size of choice).
- Instances are launched as spot requests to favor cost over availability.
- You must configure your VPC, routing tables, and security groups to allow outbound traffic to Rigor resources (should work with default settings).
- EC2 instances will _not_ have an SSH key assigned-- you will not be able to connect to them remotely.

## Configuration
1. Create a new private location within the Rigor interface
1. Update the `terraform.tfvars` file providing the key from the private location setup instruaction and any other changes desired
1.
    ```sh
    terraform apply
    ```

## More reading
- [Getting Started with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
- [Amazon ECS-Optimized AMI](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-ami-versions.html)
- [Amazon ECS Container Instance IAM Role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html)
- [Amazon ECS Service Scheduler IAM Role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_IAM_role.html)