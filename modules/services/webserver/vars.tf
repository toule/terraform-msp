variable "ami_id" {
  description = "AWS AMI"
}

variable "http_port" {
  description = "http"
  default = 80
}

variable "ssh_port" {
  description = "ssh"
  default = 22
}

variable "ec2_count" {
  description = "ec2 number setting"
  default = 0
}

variable "any_ip" {
  description = "any IPv4 address at all"
  default = "0.0.0.0/0"
}

variable "cluster" {
  description = "Set name for current cluster configuration"
}

variable "instance_type" {
  description = "The type of EC2 Instance to run (t2.micro, m5.large)"
}

variable "stage" {
  description = "Current Stage"
}

variable "alb-name" {
  description = "aws load balancer name setting"
}

variable "target-name" {
  description = "aws load balancer target name setting"
}

variable "min_size" {
  description = "Set the smallest number of ec2 in autoscaling"
  default = 0
}

variable "max_size" {
  description = "Set the largest number of ec2 in autoscaling"
  default = 0
}