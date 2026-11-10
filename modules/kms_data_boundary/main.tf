terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_kms_key" "sovereign_key" {
  description             = "Customer Managed Key (CMK) for EU Sovereign AI model weights and memory in Frankfurt"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = {
    Name        = "${var.environment}-sovereign-kms-key"
    Compliance  = "GDPR-Art-32"
    Environment = var.environment
  }
}

resource "aws_kms_alias" "sovereign_key_alias" {
  name          = "alias/${var.environment}-sovereign-ai-key"
  target_key_id = aws_kms_key.sovereign_key.key_id
}
