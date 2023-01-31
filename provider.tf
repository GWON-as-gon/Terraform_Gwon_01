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
  access_key = "AKIASHVHFBLEBMTZXX3L"
  secret_key = "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"
}