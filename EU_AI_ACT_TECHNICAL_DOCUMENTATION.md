# EU AI Act Technical Documentation (Sovereign Infrastructure)

**Regulation Reference**: Regulation (EU) 2024/1689 of the European Parliament and of the Council  
**Classification**: Sovereign Cloud Infrastructure & Data Residency Platform  
**System Name**: Sovereign Cloud Terraform & OpenTofu Blueprints  
**Version**: 1.0.0  
**Primary Region**: AWS Frankfurt (`eu-central-1`) • European Economic Area (EEA)  

---

## 1. Scope & Sovereign Data Perimeter
These infrastructure blueprints define the cloud hosting perimeter for High-Risk AI Systems operating within the European Union. They guarantee:
- **Zero Egress**: Model inference instances run inside private subnets without public IPv4 addresses, communicating via AWS PrivateLink VPC endpoints.
- **Data Protection by Design (GDPR Art. 25 & 32)**: Cryptographic isolation with Customer-Managed Keys (CMK) ensuring third-party cloud providers cannot decrypt stored weights or vector memory.
- **Auditability (EU AI Act Art. 12)**: Continuous VPC Flow Logs and AWS CloudTrail recording every internal packet trajectory.
