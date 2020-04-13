resource "aws_lb" "alb" {
    name = "${var.alb-name}"
    internal = false
    load_balancer_type = "application"
    security_groups = ["${aws_security_group.elb_sg.id}"]
    subnets = ["${data.terraform_remote_state.vpc.outputs.public_subnet_A_id}","${data.terraform_remote_state.vpc.outputs.public_subnet_C_id}"]
  
    tags = {
        Name = "${var.cluster}-ALB"
        Project = "${module.global_var.project_name}"
        Location = "${module.global_var.location}"
        Configuration = "ALB"
        Stage = "${var.stage}"
    }
}

resource "aws_lb_target_group" "tg-deploy" {
    name = "${var.target-name}"
    port = "${var.http_port}"
    protocol = "HTTP"
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
    lifecycle {
        ignore_changes = [name]
        create_before_destroy = true
    }
}

resource "aws_lb_listener" "alb-listener" {
    load_balancer_arn = "${aws_lb.alb.arn}"
   port = "${var.http_port}"
    protocol = "HTTP"
    
    default_action {
        type = "forward"
        target_group_arn = "${aws_lb_target_group.tg-deploy.arn}"
    }
}

resource "aws_lb_target_group_attachment" "alb-attach" {
    count = "${var.ec2_count}"
    target_group_arn = "${aws_lb_target_group.tg-deploy.arn}"
    target_id = "${aws_instance.instance[count.index].id}"
    port = "${var.http_port}"
}