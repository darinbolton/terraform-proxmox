# terraform-proxmox-lab

Terraform configurations built during study for the HashiCorp Terraform Associate (004) certification.

## Structure

| Directory | Contents |
|---|---|
| `week2/` | HCL fundamentals — variables, for_each, lifecycle, outputs |
| `week3/` | State management — S3 backend, drift detection, moved/removed blocks |
| `modules/proxmox-lxc/` | Reusable LXC module (Week 4) |
| `week5/` | HCP Terraform cloud block integration (Week 5) |

## Prerequisites

- Proxmox VE cluster
- Terraform 1.12+
- `terraform@pve` API token with PVEVMAdmin role
- S3-compatible backend (Minio)

## Usage

Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your values, then:

```bash
terraform init
terraform plan
terraform apply
```
