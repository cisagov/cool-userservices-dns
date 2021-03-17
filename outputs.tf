output "read_terraform_state" {
  value       = module.read_terraform_state
  description = "The IAM policies and role that allow read-only access to the cool-userservices-dns state in the Terraform state bucket."
}
