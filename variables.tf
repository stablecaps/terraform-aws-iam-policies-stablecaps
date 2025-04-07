variable "role_name" {
  description = "AWS IAM role name. String must contain $env"
  type        = string
  validation {
    condition = (
      can(regex("(dev|uat|prod|live-test)", var.role_name))
    )
    error_message = "Invalid. Must contain: 'dev', 'uat', 'prod', 'live-test'."
  }
}

variable "role_desc" {
  description = "AWS IAM role description. String must contain $env"
  type        = string
  validation {
    condition = (
      can(regex("(dev|uat|prod|live-test)", var.role_desc))
    )
    error_message = "Invalid. Must contain : 'dev', 'uat', 'prod', 'live-test'."
  }
}

variable "role_path" {
  description = "AWS IAM role path location. String must begin with '/(live-test|lambda|ec2)*'"
  type        = string
  validation {
    condition = (
      can(regex("/(stablecaps|lambda|ec2|live-test)/", var.role_path))
    )
    error_message = "Invalid. Must start with: /(live-test|lambda|ec2)*."
  }
}

variable "trusted_entity_principals" {
  description = "IAM Trusted entity principals"
  type        = map(string)
}

variable "custom_policies" {
  description = "Map of maps containing IAM policy definitions. Map key is used as policy name"
  type        = any
  default     = {}
}

variable "managed_policies" {
  description = "List containing IAM managed policy arns."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}
