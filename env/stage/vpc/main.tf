module "global_var" {
  source = "../../../global"
}

provider "aws" {
  region = "${module.global_var.region}"
}

module "vpc_info" {
  source = "../../../modules/services/vpc"

  network_name = "${var.stage}-internal"
  stage = "${var.stage}"
  vpc_cidr = "10.0.0.0/16"
  public_a_cidr = "10.0.1.0/24"
  public_c_cidr = "10.0.2.0/24"
  private_a_cidr = "10.0.3.0/24"
  private_c_cidr = "10.0.4.0/24"
}

terraform {
  backend "s3" {
    bucket = "msp-infra-config-db-rayhli"
    key = "external-infra/msp-1/stage/vpc/terraform.tfstate"
    region = "ap-northeast-2" #Not Allow Variable
    encrypt = true
    acl = "public"
  }
}
