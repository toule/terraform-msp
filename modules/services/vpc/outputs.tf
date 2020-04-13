output "vpc_id" {
  value = "${aws_vpc.main_vpc.id}"
}

output "public_subnet_A_id" {
  value = "${aws_subnet.publicA.id}"
}

output "public_subnet_C_id" {
  value = "${aws_subnet.publicC.id}"
}

output "private_subnet_A_id" {
  value = "${aws_subnet.privateA.id}"
}

output "private_subnet_C_id" {
  value = "${aws_subnet.privateC.id}"
}
