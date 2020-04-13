module "global_var" {
  source = "../../../global"
}

#Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.network_name}-VPC"
    Project = "${module.global_var.project_name}"
    Location = "${module.global_var.location}"
    Configuration = "VPC"
    Stage = "${var.stage}"
  }
}

resource "aws_subnet" "publicA" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  availability_zone = "${module.global_var.region}a"
  cidr_block = "${var.public_a_cidr}"

  tags = {
    Name = "${var.network_name}-Public-A" 
    Project = "${module.global_var.project_name}"
    Configuration = "Public A"
    Stage = "${var.stage}"
  }
}

resource "aws_subnet" "publicC" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  availability_zone = "${module.global_var.region}c"
  cidr_block = "${var.public_c_cidr}"

  tags = {
    Name = "${var.network_name}-Public-C"
    Project = "${module.global_var.project_name}"
    Configuration = "Public C"
    Stage = "${var.stage}" 
 }
}

resource "aws_subnet" "privateA" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  availability_zone = "${module.global_var.region}a"
  cidr_block = "${var.private_a_cidr}"

  tags = {
    Name = "${var.network_name}-Private-A" 
    Project = "${module.global_var.project_name}"
    Configuration = "Private A"
    Stage = "${var.stage}"
  }
}

resource "aws_subnet" "privateC" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  availability_zone = "${module.global_var.region}c"
  cidr_block = "${var.private_c_cidr}"

  tags = {
    Name = "${var.network_name}-Private-C"
    Project = "${module.global_var.project_name}"
    Configuration = "Private C"
    Stage = "${var.stage}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  tags = {
    Name = "${var.network_name}-IGW"
    Project = "${module.global_var.project_name}"
    Configuration = "Internet Gateway"
    Stage = "${var.stage}"
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  route {
    cidr_block = "${var.any}"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.network_name}-Public-RT"
    Project = "${module.global_var.project_name}-Public-RT}"
    Configuration = "Public Route Table"
    Stage = "${var.stage}"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id = "${aws_subnet.publicA.id}"
  route_table_id = "${aws_route_table.publicRT.id}"
}

resource "aws_route_table_association" "public_c" {
  subnet_id = "${aws_subnet.publicC.id}"
  route_table_id = "${aws_route_table.publicRT.id}"
}

resource "aws_route_table" "privateRT" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  tags = {
    Name = "${var.network_name}-Private-RT"
    Project = "${module.global_var.project_name}-Private-RT}"
    Configuration = "Private Route Table"
    Stage = "${var.stage}"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id = "${aws_subnet.privateA.id}"
  route_table_id = "${aws_route_table.privateRT.id}"
}

resource "aws_route_table_association" "private_c" {
  subnet_id = "${aws_subnet.privateC.id}"
  route_table_id = "${aws_route_table.privateRT.id}"
}
