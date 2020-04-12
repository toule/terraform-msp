module "global_var" {
  source = "../../../global"
}

provider "aws" {
  region = "${module.global_var.region}"
}

module "instance" {
  source = "../../../modules/services/webserver"
  ec2_count = "${var.ec2_count}"
  cluster = "${var.cluster}-${var.stage}"
  ami_id = "ami-08ab3f7e72215fe91"
  instance_type = "t2.micro"
  stage = "${var.stage}"
  alb-name = "${var.cluster}-${var.stage}-alb"
  target-name = "${var.cluster}-${var.stage}-alb-target"
}

terraform {
  backend "s3" {
    bucket = "msp-infra-config-db-rayhli"
    key = "internal-infra/dev/service/terraform.tfstate"
    region = "ap-northeast-2"
    encrypt = true
  }
}