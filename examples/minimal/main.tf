variable "region" {
  type = string
}

variable "profile" {
  type = string
}

variable "vpc_id" {
  type = string
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "my_endpoints" {
  source = "../../"
  vpc_id = var.vpc_id
  enabled_interface_endpoints = ["s3"]
}

output "s3_arn" {
  value = module.my_endpoints.interface_endpoints["s3"]["arn"]
}

output "security_group_ids" {
  value = module.my_endpoints.security_group_ids
}
