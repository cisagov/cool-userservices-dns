# This is the "default" provider that is used to obtain the caller's
# credentials, which are used to set the session name when assuming roles in
# the other providers.

provider "aws" {
  region = var.aws_region
}

# The provider used to modify DNS records in the cyber.dhs.gov zone.
provider "aws" {
  alias  = "dns_cyber_dhs_gov"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.dns_cyber_dhs_gov.outputs.route53resourcechange_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to lookup account IDs.  See locals.
provider "aws" {
  alias  = "organizationsreadonly"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.master.outputs.organizationsreadonly_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Terraform account.
provider "aws" {
  alias  = "terraform"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.terraform.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create resources inside the Users account.
provider "aws" {
  alias  = "users"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.users.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create Domain Manager resources inside the
# User Services account.
provider "aws" {
  alias  = "userservices_domainmanager"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.userservices.outputs.provisiondomainmanager_role.arn
    session_name = local.caller_user_name
  }
}
