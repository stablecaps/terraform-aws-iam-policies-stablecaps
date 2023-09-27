terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
  required_version = "= 1.0.6"
}

provider "aws" {
  region = "eu-west-1"
}

################################
variable "env" {
  description = "Deployment environment. e.g. dev, uat, prod"
  type        = string
  default     = "live-test"
}

variable "app_name" {
  description = "Aplication name"
  type        = string
  default     = "tfmod-rolepol-gen-eg2"
}

variable "trusted_entity_principals" {
  description = "IAM Trusted entity principals"
  type        = map(string)
  default = {
    Service = "ec2.amazonaws.com"
  }
}

################################
locals {
  role_name = "${var.app_name}-${var.env}"
  role_desc = "test iam role for ${var.app_name} - ${var.env}"
  role_path = "/live-test/${var.env}/"
}

################################
module "basic_role_example" {
  source = "../../"

  role_name = local.role_name
  role_desc = local.role_desc
  role_path = local.role_path

  trusted_entity_principals = var.trusted_entity_principals
  custom_policies           = {}
  managed_policies          = {}

  tags = { Name = local.role_name }
}

################################
output "iam_role_arn" {
  description = "IAM role arn"
  value       = module.basic_role_example.iam_role_arn
}

output "iam_role_id" {
  description = "IAM role ID"
  value       = module.basic_role_example.iam_role_id
}