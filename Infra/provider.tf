# Configure the AWS Provider
provider "aws" {
  region = local.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${local.aws_account_id}:role/OrganizationAccountAccessRole"
  }
}
