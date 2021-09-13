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
| terraform | ~> 0.13.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.organizationsreadonly | ~> 3.38 |
| terraform | n/a |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| read\_terraform\_state | github.com/cisagov/terraform-state-read-role-tf-module | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_organizations_organization.cool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [terraform_remote_state.master](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.terraform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.userservices](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| read\_terraform\_state\_role\_name | The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the cool-userservices-dns state in the S3 bucket where Terraform state is stored. | `string` | `"ReadUserServicesDNSTerraformState"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| read\_terraform\_state | The IAM policies and role that allow read-only access to the cool-userservices-dns state in the Terraform state bucket. |

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
