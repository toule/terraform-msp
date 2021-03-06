data "template_file" "user_data" {
  template = "${file("${path.module}/userdata.tpl")}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "${module.global_var.bucket}"
    region = "${module.global_var.region}"
    key = "${module.global_var.location}-infra/env/${var.stage}/vpc/terraform.tfstate"
    encrypt = true
  }
}
