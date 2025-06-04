# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

# A single workload token can be trusted by multiple accounts - but optionally, you can generate a
# separate token with a difference audience value for your second account and use it below.
#
# identity_token "account_2" {
#   audience = ["<Set to your AWS IAM assume-role audience>"]
# }

deployment "development" {
  inputs = {
    regions        = ["ap-southeast-2"]
    role_arn       = "arn:aws:iam::804453558652:role/tfstacks-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-multi-account-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["ap-southeast-2", "ap-southeast-1"]
    role_arn       = "arn:aws:iam::804453558652:role/tfstacks-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "ambda-multi-account-stack" }
  }
}

deployment "production-aucklandcouncil" {
  inputs = {
    regions        = ["ap-southeast-2", "ap-southeast-1"]
    role_arn       = "arn:aws:iam::804453558652:role/tfstacks-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "ambda-multi-account-stack" }
  }
}
