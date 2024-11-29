# Terraform Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

provider "aws" {

  region = var.allowed_regions[0] # Use only allowed regions
}

