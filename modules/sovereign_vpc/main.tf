terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "sovereign_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name             = "${var.environment}-sovereign-vpc"
    DataResidency    = "European-Economic-Area"
    Region           = "eu-central-1"
    RegulatoryTier   = "EU-AI-Act-Sovereign"
  }
}

resource "aws_subnet" "private_gpu_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.sovereign_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment}-isolated-gpu-${var.availability_zones[count.index]}"
    Tier = "Private-Inference"
  }
}

# VPC Flow Logs (EU AI Act Article 12 Audit Trail)
resource "aws_flow_log" "vpc_audit_flow_log" {
  log_destination_type = "cloud-watch-logs"
  log_group_name       = "/aws/vpc/${var.environment}-sovereign-flow-logs"
  iam_role_arn         = var.flow_log_role_arn
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.sovereign_vpc.id
}
