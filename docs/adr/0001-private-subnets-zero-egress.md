# 1. Zero-Egress Private Subnet Architecture for GPU Clusters

Date: 2026-02-01

## Status
Accepted

## Context
Deploying enterprise LLMs in cloud environments creates the risk of unintended telemetry or prompt exfiltration over public internet gateways.

## Decision
All GPU inference instances (`g5`, `p4d`) are provisioned exclusively in private subnets with `map_public_ip_on_launch = false`. All required AWS service access (S3, ECR, CloudWatch) is achieved via in-VPC Interface Endpoints (AWS PrivateLink).

## Consequences
- 100% network isolation adhering to European Data Boundary mandates.
- Management access is restricted to AWS Systems Manager (SSM) Session Manager without requiring open SSH ports.
