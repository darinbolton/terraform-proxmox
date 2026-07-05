variable "proxmox_endpoint" {
  type        = string
  description = "Proxmox API URL"
}

variable "proxmox_api_token" {
  type        = string
  sensitive   = true
  description = "API token — terraform@pve!terraform=<secret>"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "lab"

  validation {
    condition     = contains(["lab", "dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: lab, dev, staging, prod."
  }
}

variable "containers" {
  type = map(object({
    vmid    = number
    cores   = number
    memory  = number
    disk_gb = number
    role    = string
  }))
  description = "Map of containers to provision"
  default = {
    web = {
      vmid    = 210
      cores   = 1
      memory  = 512
      disk_gb = 8
      role    = "web"
    }
    db = {
      vmid    = 211
      cores   = 1
      memory  = 1024
      disk_gb = 8
      role    = "database"
    }
    cache = {
      vmid    = 212
      cores   = 1
      memory  = 256
      disk_gb = 8
      role    = "cache"
    }
  }
}

variable "template" {
  type        = string
  description = "CT template file ID in Proxmox storage"
  default     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "minio" {
  type = string
  description = "Minio S3 storage for Terraform"
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_"
}