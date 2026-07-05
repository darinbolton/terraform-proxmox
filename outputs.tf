output "container_ids" {
  description = "VMID of each provisioned container"
  value       = { for k, v in proxmox_virtual_environment_container.lab : k => v.vm_id }
}

output "container_hostnames" {
  description = "Hostname of each provisioned container"
  value       = { for k, v in proxmox_virtual_environment_container.lab : k => v.initialization[0].hostname }
}

output "environment" {
  description = "Active environment label"
  value       = var.environment
}