# cool-userservices-dns #

[![GitHub Build Status](https://github.com/cisagov/cool-userservices-dns/workflows/build/badge.svg)](https://github.com/cisagov/cool-userservices-dns/actions)

This is a Terraform deployment to create DNS-related resources needed for
services in the COOL User Services account.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
- The following COOL accounts and roles must have been created:
  - Master:
    [`cisagov/cool-accounts/master`](https://github.com/cisagov/cool-accounts/master)
  - Terraform:
    [`cisagov/cool-accounts/terraform`](https://github.com/cisagov/cool-accounts/terraform)
  - User Services:
    [`cisagov/cool-accounts-userservices`](https://github.com/cisagov/cool-accounts-userservices)
  - Users:
    [`cisagov/cool-accounts/users`](https://github.com/cisagov/cool-accounts/users)
- Terraform in [`cisagov/cool-dns-cyber.dhs.gov`](https://github.com/cisagov/cool-dns-cyber.dhs.gov)
  must have been applied.
- Terraform in [`cisagov/cool-userservices-networking`](https://github.com/cisagov/cool-userservices-networking)
  must have been applied.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#Inputs) below for details):

  ```hcl
  domainmanager_subdomain = "domain-manager.cool"
  ```

1. Run the command `terraform init`.
1. Run the command `terraform apply -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| aws.dns_cyber_dhs_gov | ~> 3.0 |
| aws.organizationsreadonly | ~> 3.0 |
| aws.terraform | ~> 3.0 |
| aws.users | ~> 3.0 |
| aws.userservices_domainmanager | ~> 3.0 |
| terraform | n/a |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume_read_terraform_state_policy_description | The description to associate with the IAM policy that allows assumption of the role that allows read-only access to Terraform state for cool-userservices-dns. | `string` | `Allow assumption of the ReadUserServicesDNSTerraformState role in the Terraform account.` | no |
| assume_read_terraform_state_policy_name | The name to assign the IAM policy that allows assumption of the role that allows read-only access to Terraform state for cool-userservices-dns. | `string` | `AssumeReadUserServicesDNSTerraformState` | no |
| aws_region | The AWS region to deploy into (e.g. us-east-1) | `string` | `us-east-1` | no |
| domainmanager_subdomain | The subdomain for Domain Manager (e.g. "domain-manager.cool"). | `string` | n/a | yes |
| read_terraform_state_role_description | The description to associate with the IAM role (as well as the corresponding policy) that allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored. | `string` | `Allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored.` | no |
| read_terraform_state_role_name | The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored. | `string` | `ReadUserServicesDNSTerraformState` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| assume_read_terraform_state_role_policy | The policy that allows assumption of the role that allows read-only access to the cool-userservices-dns state in the Terraform state bucket. |
| domainmanager_certificate | The ACM certificate for Domain Manager. |
| read_terraform_state_role | The role that allows read-only access to the cool-userservices-dns state in the Terraform state bucket. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is just the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
