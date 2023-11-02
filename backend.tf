terraform {
  backend "s3" {
    bucket = "s3-rac3-vault"
    key    = "terraform.tfstate"
    region = "us-east-1"
    // profile = "aws-ds-s3"
  }
}
