output "assume_read_terraform_state_role_policy" {
  value       = aws_iam_policy.assume_read_terraform_state_role
  description = "The policy that allows assumption of the role that allows read-only access to the cool-userservices-dns state in the Terraform state bucket."
}

output "read_terraform_state_role" {
  value       = aws_iam_role.read_terraform_state
  description = "The role that allows read-only access to the cool-userservices-dns state in the Terraform state bucket."
}
