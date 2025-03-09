terraform {
  required_version = "~> 1.11.0"

  backend "s3" {
    bucket       = "s3-native-lock-setup"
    key          = "backend/terraform.tfstate"
    region       = "eu-north-1"
    profile      = "ProfileForAccount-12345678910" # This profile is used to access the S3 bucket
    use_lockfile = true
  }
}

provider "aws" {
  region  = "eu-north-1"
  profile = "ProfileForAccount-12345678910" # This profile is used to create the IAM user
}

# Creates a new IAM user to test the state locking
resource "aws_iam_user" "native_lock_setup" {
  name = "native_lock_setup"
}
