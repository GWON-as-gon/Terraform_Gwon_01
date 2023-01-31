terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "ap-northeast-2"
  access_key = "<AWS_ACCESS_KEY_ID>"
  secret_key = "<AWS_SECRET_ACCESS_KEY>"
}