# Project-03: AWS Infrastructure Automation Using Terraform & GitHub Actions

## Overview

This project automates AWS infrastructure deployment using **Terraform** and **GitHub Actions**.

Terraform is used to create the AWS resources and GitHub Actions handles the CI/CD process including validation, plan, approval and apply.

## Architecture

The project creates the following AWS resources:

- VPC
- Two Public Subnets
- Internet Gateway
- Public Route Table
- Route Table Associations
- Security Group
- EC2 Instance
- Elastic IP
- S3 Bucket
- IAM Role
- IAM Instance Profile
- Terraform Remote State S3 Bucket

## Terraform Modules

The Terraform code is organized using reusable modules.

```text
terraform-aws-automation/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── bootstrap/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars.example
├── user-data.sh
├── variables.tf
├── versions.tf
└── .gitignore
```

## Remote State

Terraform state is stored in Amazon S3.

The state bucket has:

- Versioning enabled
- Encryption enabled
- Public access blocked
- Terraform state locking enabled

## EC2 Web Server

The EC2 instance is configured automatically using Terraform User Data.

User Data:

- Installs Nginx
- Starts the Nginx service
- Creates a custom landing page

Application URL:

```text
http://15.207.79.231
```

## S3 Security

The application S3 bucket is configured with:

- Versioning enabled
- Server-side encryption enabled
- Block Public Access enabled

## IAM and Security

The project uses:

- IAM Role for EC2
- IAM Instance Profile
- Restricted S3 permissions
- Security Group allowing HTTP on port 80
- GitHub OIDC authentication for AWS access

AWS credentials are not hardcoded in the Terraform or GitHub Actions workflow.

## GitHub Actions CI/CD

The workflow runs automatically when changes are pushed to the `main` branch.

Workflow:

```text
GitHub
  ↓
Checkout
  ↓
Terraform Format
  ↓
Terraform Init
  ↓
Terraform Validate
  ↓
Terraform Plan
  ↓
Upload Plan Artifact
  ↓
Manual Approval
  ↓
Terraform Apply
  ↓
Terraform Outputs
  ↓
Application Validation
```

The Terraform Apply job uses the protected `production` environment and requires manual approval.

## Terraform Outputs

The project displays important values after deployment:

- VPC ID
- Public Subnet IDs
- EC2 Instance ID
- Elastic IP
- Application URL
- Security Group ID
- IAM Role Name
- S3 Bucket Name

## Commands

Initialize Terraform:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt -recursive
```

Validate:

```bash
terraform validate
```

Create a plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

View outputs:

```bash
terraform output
```

## Final Result

The AWS infrastructure was successfully created using Terraform.

GitHub Actions successfully performs the Terraform Plan and Apply process with a manual approval step before deployment.

The Nginx web server is running successfully and is accessible through the Elastic IP.
