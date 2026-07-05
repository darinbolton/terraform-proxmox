resource "proxmox_virtual_environment_container" "lab" {
  for_each = var.containers

  description = "Managed by Terraform | role: ${each.value.role} | env: ${var.environment}"
  node_name   = "pve"
  vm_id       = each.value.vmid
  tags = concat(local.common_tags, ["role-${each.value.role}"])

  started = true

  initialization {
    hostname = "${local.name_prefix}${each.key}-01"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  cpu {
    cores = each.value.cores
  }

  memory {
    dedicated = each.value.memory
  }

  disk {
    datastore_id = "local-lvm"
    size         = each.value.disk_gb
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  operating_system {
    template_file_id = var.template
    type             = "ubuntu"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}