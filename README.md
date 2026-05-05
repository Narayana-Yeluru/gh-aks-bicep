# 🚀 AKS Infrastructure as Code with Bicep & GitHub Actions

![Bicep](https://img.shields.io/badge/IaC-Bicep-0078D4?logo=microsoftazure)
![Azure](https://img.shields.io/badge/Cloud-Azure-0078D4?logo=microsoftazure)
![AKS](https://img.shields.io/badge/Kubernetes-AKS-326CE5?logo=kubernetes)
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?logo=githubactions)

---

## 📌 Overview

This project demonstrates a production-style Infrastructure as Code (IaC) setup using Bicep to deploy an Azure Kubernetes Service (AKS) cluster.

It uses GitHub Actions for CI/CD with:
- Multi-environment deployments (dev / test / prod)
- Pre-deployment validation using What-If
- Secure authentication using GitHub Secrets
- Modular and reusable Bicep design

---

## 🏗️ Architecture

Developer → GitHub Repo → Workflow Dispatch  
↓  
GitHub Actions Pipeline  
↓  
Bicep Build → Validate → What-If → Deploy  
↓  
Azure Subscription  
↓  
AKS Cluster Provisioned  

---

## 📁 Repository Structure

<img width="225" height="272" alt="image" src="https://github.com/user-attachments/assets/00c06695-244b-4131-b57d-1325085a59ac" />


github-aks-bicep/
├── .github/
│   └── workflows/
│       └── deploy-aks.yml
├── infra/
│   ├── main.bicep
│   ├── modules/
│   │   └── aks.bicep
│   └── params/
│       ├── dev.bicepparam
│       ├── test.bicepparam
│       └── prod.bicepparam
└── README.md

---

## ⚙️ Prerequisites

- Azure Subscription  
- GitHub Repository  
- Azure CLI (latest recommended)  
- Bicep CLI (via Azure CLI)  

---

## 🔐 Authentication (GitHub → Azure)

This project uses Service Principal authentication via GitHub Secrets.

Required GitHub Secrets:
- AZURE_CLIENT_ID  
- AZURE_TENANT_ID  
- AZURE_SUBSCRIPTION_ID  

---

## 🚀 CI/CD Workflow

Workflow file:
.github/workflows/deploy-aks.yml

Trigger:
- Manual workflow_dispatch
- Environment selection: dev / test / prod

---

## 🔄 Pipeline Flow

1. Login to Azure  
2. Create Resource Group (if not exists)  
3. Bicep Build  
4. Validate template  
5. What-If deployment (preview changes)  
6. Actual deployment  

---

## 🧪 Bicep Workflow (Local Development)

Build:
az bicep build --file infra/main.bicep

Validate:
az deployment group validate \
  --resource-group <rg-name> \
  --template-file infra/main.bicep \
  --parameters infra/params/dev.bicepparam

What-If:
az deployment group what-if \
  --resource-group <rg-name> \
  --template-file infra/main.bicep \
  --parameters infra/params/dev.bicepparam

Deploy:
az deployment group create \
  --resource-group <rg-name> \
  --template-file infra/main.bicep \
  --parameters infra/params/dev.bicepparam

---

## ☁️ Infrastructure Deployed

- Azure Resource Group  
- Azure Kubernetes Service (AKS)  
- System Node Pool  
- Managed Identity  
- Azure-managed networking  

---

## 📌 Key Features

- Fully automated CI/CD using GitHub Actions  
- Multi-environment deployments  
- What-If validation before deployment  
- Modular Bicep templates  
- Secure authentication (no secrets in code)  
- Idempotent deployments  

---

## ⚠️ Real-World Challenges Solved

- Region typo issues  
- VM SKU restrictions  
- vCPU quota limitations  
- Bicep syntax errors  

---

## 🚀 Future Enhancements

- Approval gates for production  
- Private AKS cluster  
- Azure Container Registry (ACR) integration  
- GitOps (Flux / ArgoCD)  
- Monitoring (Azure Monitor)  

---

## 👨‍💻 Author

Built using:
- Bicep  
- Azure Kubernetes Service (AKS)  
- GitHub Actions  

---

## 📜 License

For learning and DevOps portfolio use only.
