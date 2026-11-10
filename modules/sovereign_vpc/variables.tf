variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "flow_log_role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/VPCFlowLogsRole"
}
