# Sovereign Cloud Terraform Blueprints 🇪🇺

<p align="left">
  <img src="https://img.shields.io/badge/IaC-Terraform%20%7C%20OpenTofu-8B5CF6?style=flat-square&logo=terraform" alt="Terraform">
  <img src="https://img.shields.io/badge/Region-AWS%20Frankfurt%20(eu--central--1)-0EA5E9?style=flat-square&logo=amazon-aws" alt="AWS Frankfurt">
  <a href="EU_AI_ACT_TECHNICAL_DOCUMENTATION.md"><img src="https://img.shields.io/badge/Compliance-EU%20AI%20Act%20Annex%20IV-10B981?style=flat-square" alt="EU AI Act"></a>
  <a href="docs/adr/"><img src="https://img.shields.io/badge/Architecture-ADRs-F59E0B?style=flat-square" alt="ADRs"></a>
  <img src="https://img.shields.io/badge/Security-Zero%20Egress%20VPC-EC4899?style=flat-square" alt="Zero Egress">
</p>

Production-ready, battle-tested **Terraform & OpenTofu infrastructure blueprints** for deploying isolated, zero-egress Sovereign AI and model inference clusters (vLLM / Triton) within **AWS Frankfurt (`eu-central-1`)** and European cloud perimeters. Adheres strictly to **EU AI Act**, **GDPR**, and **Schrems II** data residency requirements.

---

## 📑 Table of Contents
- [Architecture Overview](#-architecture-overview)
- [Modules Included](#-modules-included)
- [Quick Start](#-quick-start)
- [Security & Compliance Controls](#-security--compliance-controls)
- [License](#-license)

---

## 🏗️ Architecture Overview

```
                      Internet
                         │ (Blocked - Zero Ingress)
                         ▼
        ┌───────────────────────────────────┐
        │ AWS eu-central-1 (Frankfurt VPC)  │
        │                                   │
        │   ┌───────────────────────────┐   │
        │   │ Isolated GPU Subnets      │   │
        │   │ (No Public IP Addresses)  │   │
        │   │                           │   │
        │   │   [vLLM Inference Pods]   │   │
        │   │   (NVIDIA A100 / H100)    │   │
        │   └───────────────────────────┘   │
        │                 │                 │
        │                 ▼ (PrivateLink)   │
        │   ┌───────────────────────────┐   │
        │   │ In-Region VPC Endpoints   │   │
        │   │ (S3, ECR, CloudWatch)     │   │
        │   └───────────────────────────┘   │
        │                 │                 │
        │                 ▼                 │
        │   ┌───────────────────────────┐   │
        │   │ KMS Customer-Managed Key  │   │
        │   │ (Envelope Encryption)     │   │
        │   └───────────────────────────┘   │
        └───────────────────────────────────┘
```

---

## 📦 Modules Included

1. **`sovereign_vpc`**: Multi-tier isolated VPC with private-only subnets for GPU clusters, no public IP assignments, and VPC Flow Logs.
2. **`kms_data_boundary`**: KMS Customer-Managed Keys (CMK) with automated rotation and cryptographic access controls under GDPR Article 32.
3. **`environments/eu-central-1-frankfurt`**: Turnkey environment module deploying the complete sovereign stack with standardized compliance tagging.

---

## 🚀 Quick Start

```bash
cd environments/eu-central-1-frankfurt
terraform init
terraform plan
```

---

## 📄 License
This project is licensed under the MIT License.
