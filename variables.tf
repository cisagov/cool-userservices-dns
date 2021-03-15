# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assume_read_terraform_state_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows assumption of the role that allows read-only access to Terraform state for cool-userservices-dns."
  default     = "Allow assumption of the ReadUserServicesDNSTerraformState role in the Terraform account."
}

variable "assume_read_terraform_state_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows assumption of the role that allows read-only access to Terraform state for cool-userservices-dns."
  default     = "AssumeReadUserServicesDNSTerraformState"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)"
  default     = "us-east-1"
}

variable "read_terraform_state_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored."
  default     = "Allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored."
}

variable "read_terraform_state_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored."
  default     = "ReadUserServicesDNSTerraformState"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
