# --------------------------------------------------------------------------
# Fetching AWS provider and setting the project backend to be remote on AWS
# --------------------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }

  backend "s3" {
    bucket         = "mohaned-terraform-backend"
    key            = "states/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "mohaned-terraform-backend"
  }
}


# ---------------------------------------------------------------------
# Setting the configurations of AWS provider
# ---------------------------------------------------------------------

provider "aws" {
  region  = var.region
  profile = "default"
}