output "rg_ids" {
  value = { for rg, value in module.resource_groups : rg => value.id }
}

output "vnet_ids" {
  value = { for vnet, value in module.virtual_networks : vnet => value.id }
}

output "subnet_ids" {
  value = { for subnet, value in module.subnets : subnet => value.id }
}

output "pip_ips" {
  value = { for pip, value in module.pips : pip => value.pip }
}

output "nsg_ids" {
  value = { for nsg, value in module.nsgs : nsg => value.id }
}


output "private_ips" {
  value = { for nic, value in module.nics : nic => value.privateip }
}

output "nic_ids" {
  value = { for nic, value in module.nics : nic => value.id }
}

output "vm_ids" {
  value = { for vm, value in module.vms : vm => value.id }
}
