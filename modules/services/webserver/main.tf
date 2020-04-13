module "global_var" {
  source = "../../../global"
}

#Create Instance
resource "aws_instance" "instance" {
  count = "${var.ec2_count}"
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${module.global_var.region}a"
  vpc_security_group_ids = ["${aws_security_group.elb_target_sg.id}","${aws_security_group.ssh_sg.id}"]
  associate_public_ip_address = true
  subnet_id = "${data.terraform_remote_state.vpc.outputs.public_subnet_A_id}"
  user_data = "${data.template_file.user_data.rendered}"

  tags = {
    Name = "${var.cluster}-EC2"
    Project = "${module.global_var.project_name}"
    Location = "${module.global_var.location}"
    Configuration = "EC2"
    Stage = "${var.stage}"
  }
}