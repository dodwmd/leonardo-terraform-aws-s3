terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70"
    }
  }
  required_version = ">= 0.12.0, < 2.0.0"

}