# ------------------------------------------------------------------------------
# Retrieves state data from a Terraform backend. This allows use of the
# root-level outputs of one or more Terraform configurations as input data
# for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/master.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "terraform" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/terraform.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/users.tfstate"
  }

  # There is only one environment for this account, so there is
  # no need to match the current Terraform workspace.
  workspace = "production"
}

data "terraform_remote_state" "userservices" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts-userservices/terraform.tfstate"
  }

  # The current Terraform workspace must match the name of one of the
  # workspaces in cool-accounts-userservices (e.g. staging, production)
  # or else this remote state will not work.
  workspace = terraform.workspace
}
