terraform {
  backend "s3" {
    bucket         = "tf-backend-state-ru"
    dynamodb_table = "state-lock-table-20"
    key            = "global/mystatefile/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}