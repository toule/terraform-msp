resource "aws_security_group" "http_sg" {
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
    name = "allow_http"
    description = "HTTP only Allow"
    ingress {
        from_port = "${var.http_port}"
        to_port = "${var.http_port}"
        protocol = "tcp"
        cidr_blocks = ["${var.any_ip}"]
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["${var.any_ip}"]
        protocol = -1
    }
}

resource "aws_security_group" "ssh_sg" {
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
    name = "allow_ssh"
    description = "ssh only Allow"
    ingress {
        from_port = "${var.ssh_port}"
        to_port = "${var.ssh_port}"
        protocol = "tcp"
        cidr_blocks = ["${var.any_ip}"]
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["${var.any_ip}"]
        protocol = -1
    }
}

resource "aws_security_group" "elb_sg" {
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
    name = "loadbalancer-sg"
    description = "Load Balancer Security Group"
    ingress {
        from_port = "${var.http_port}"
        to_port = "${var.http_port}"
        protocol = "tcp"
        cidr_blocks = ["${var.any_ip}"]
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["${var.any_ip}"]
        protocol = -1
    }
}

resource "aws_security_group" "elb_target_sg" {
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
    name = "loadbalancer-target-sg"
    description = "Load Balancer Target Group Security Group"
    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        security_groups = ["${aws_security_group.elb_sg.id}"]
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["${var.any_ip}"]
        protocol = -1
    }
}