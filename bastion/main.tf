/**
 * The bastion host acts as the "jump point" for the rest of the infrastructure.
 * Since most of our instances aren't exposed to the external internet, the bastion acts as the gatekeeper for any direct SSH access.
 * The bastion is provisioned using the key name that you pass to the stack (and hopefully have stored somewhere).
 * If you ever need to access an instance directly, you can do it by "jumping through" the bastion.
 *
 *    $ terraform output # print the bastion ip
 *    $ ssh -i <path/to/key> ubuntu@<bastion-ip> ssh ubuntu@<internal-ip>
 *
 * Usage:
 *
 *    module "bastion" {
 *      source            = "github.com/segmentio/stack/bastion"
 *      region            = "us-west-2"
 *      security_groups   = "sg-1,sg-2"
 *      vpc_id            = "vpc-12"
 *      key_name          = "ssh-key"
 *      subnet_id         = "pub-1"
 *      environment       = "prod"
 *    }
 *
 */

variable "instance_type" {
  default     = "t3.small"
  description = "Instance type, see a list at: https://aws.amazon.com/ec2/instance-types/"
}

variable "region" {
  description = "AWS Region, e.g us-west-2"
}

variable "security_groups" {
  description = "a comma separated lists of security group IDs"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "key_name" {
  description = "The SSH key pair, key name"
}

variable "subnet_id" {
  description = "A external subnet id"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "user_data" {
  description = "Custom User Data"
  default     = ""
}

variable "name_prefix" {
  default   = ""
}

resource "aws_instance" "bastion" {
  ami                    = "ami-04e49d62cf88738f1"
  source_dest_check      = false
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = split(",", var.security_groups)
  monitoring             = true
  user_data              = var.user_data
  iam_instance_profile   = aws_iam_instance_profile.default_bastion_role.id

  tags = {
    Name        = "bastion"
    Environment = var.environment
  }
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  vpc      = true
}


resource "aws_iam_instance_profile" "default_bastion_role" {
  name = "${var.name_prefix}bastion-instance-profile-${var.environment}"
  path = "/"
  role = aws_iam_role.default_bastion_role.name
}

resource "aws_iam_role" "default_bastion_role" {
  name               = "${var.name_prefix}bastion-role-${var.environment}"
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Effect": "Allow"
    }
  ]
}
EOF

}

// Bastion external IP address.
output "external_ip" {
  value = aws_eip.bastion.public_ip
}

