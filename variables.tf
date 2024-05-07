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

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  type        = string
}

variable "read_terraform_state_role_name" {
  default     = "ReadUserServicesDNSTerraformState"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  type        = map(string)
}
