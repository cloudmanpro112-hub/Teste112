terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "s3-cloudmanpro112-backend-terraform"
    key            = "746669211265/State/main.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

# --- Main Cloud Provider ---
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

### CATEGORY: INTEGRATION ###

resource "aws_sns_topic" "Topic" {
  name                              = "Topic"
  tags                              = {
    "Name" = "Topic"
    "State" = "State"
    "CloudmanUser" = "Ricardo"
  }
}


