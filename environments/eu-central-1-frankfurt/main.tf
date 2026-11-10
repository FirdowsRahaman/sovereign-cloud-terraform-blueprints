terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1" # Frankfurt, Germany

  default_tags {
    tags = {
      Project         = "European-Sovereign-AI"
      DataResidency   = "Germany-Frankfurt"
      RegulatoryScope = "EU-AI-Act-High-Risk"
      Jurisdiction    = "European-Economic-Area"
    }
  }
}

module "sovereign_vpc" {
  source      = "../../modules/sovereign_vpc"
  environment = "prod"
  vpc_cidr    = "10.150.0.0/16"
}

module "kms_data_boundary" {
  source      = "../../modules/kms_data_boundary"
  environment = "prod"
}
