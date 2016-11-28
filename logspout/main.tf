/**
 * The worker module creates an ECS service that has no ELB attached.
 *
 * Usage:
 *
 *     module "my_worker" {
 *       source       = "github.com/segmentio/stack"
 *       environment  = "prod"
 *       name         = "worker"
 *       image        = "worker"
 *       cluster      = "default"
 *     }
 *
 */

/**
 * Required Variables.
 */

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "image" {
  description = "The docker image name, e.g nginx"
}

variable "name" {
  description = "The worker name, if empty the service name is defaulted to the image name"
  default     = ""
}

variable "version" {
  description = "The docker image version"
  default     = "latest"
}

variable "cluster" {
  description = "The cluster name or ARN"
}

/**
 * Options.
 */

variable "command" {
  description = "The raw json of the task command"
  default     = "[]"
}

variable "env_vars" {
  description = "The raw json of the task env vars"
  default     = "[]"
}

variable "desired_count" {
  description = "The desired count"
  default     = 1
}

variable "memory" {
  description = "The number of MiB of memory to reserve for the container"
  default     = 512
}

variable "cpu" {
  description = "The number of cpu units to reserve for the container"
  default     = 512
}

variable "ports" {
  description = "The docker container ports"
  default     = "[]"
}

/**
 * Resources.
 */

resource "aws_ecs_service" "main" {
  name            = "${aws_ecs_task_definition.main.name}"
  cluster         = "${var.cluster}"
  task_definition = "${aws_ecs_task_definition.main.arn}"
  desired_count   = "${var.desired_count}"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_ecs_task_definition" "main" {
  family = "${var.name}"

  lifecycle {
    ignore_changes        = ["image"]
    create_before_destroy = true
  }

  volume = {
    name = "dockersock"
    host_path  = "/var/run/docker.sock"
  }

  container_definitions = <<EOF
[
  {
    "cpu": ${var.cpu},
    "environment": ${var.env_vars},
    "essential": true,
    "command": ${var.command},
    "image": "${var.image}:latest",
    "memory": ${var.memory},
    "name": "${var.name}",
    "portMappings": ${var.ports},
    "entryPoint": "[]",
    "mountPoints": [{
       {
          "containerPath": "/tmp/docker.sock",
          "sourceVolume": "dockersock"
        }
    }]
  }
]
EOF
}

