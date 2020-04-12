variable "vpc_cidr" {
  description = "aws main vpc cidr"
}

variable "stage" {
  description = "Current Stage"
}

variable "network_name" {
  description = "network custom name"
}

variable "public_a_cidr" {
  description = "aws public A subnet cidr"
}

variable "public_c_cidr" {
  description = "aws public C subnet cidr"
}

variable "private_a_cidr" {
  description = "aws private A subnet cidr"
}

variable "private_c_cidr" {
  description = "aws private C subnet cidr"
}

variable "any" {
  description = "allow all"
  default = "0.0.0.0/0"
}
