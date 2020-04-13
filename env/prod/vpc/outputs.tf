output "vpc_id" {
  value = "${module.vpc_info.vpc_id}"
}

output "public_subnet_A_id" {
  value = "${module.vpc_info.public_subnet_A_id}"
}

output "public_subnet_C_id" {
  value = "${module.vpc_info.public_subnet_C_id}"
}

output "private_subnet_A_id" {
  value = "${module.vpc_info.private_subnet_A_id}"
}

output "private_subnet_C_id" {
  value = "${module.vpc_info.private_subnet_C_id}"
}
