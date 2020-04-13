variable "cluster" {
  description = "Set cluster name for current architecture"
  default = "nginx"
}

variable "stage" {
  description = "select stage e.g stage, prod"
  default = "prod"
}

variable "ec2_count" {
  description = "Choose the number of ec2"
  default = 3
}

variable "min_size" {
  description = "Choose the min number of ec2 autoscaling"
  default = 0
}

variable "max_size" {
  description = "Choose the max number of ec2 autoscaling"
  default = 0
}