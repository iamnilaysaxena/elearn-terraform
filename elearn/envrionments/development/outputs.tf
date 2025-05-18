output "rg_ids" {
  value = { for rg, value in module.resource_groups : rg => value.id }
}

output "vnet_ids" {
  value = { for vnet, value in module.virtual_networks : vnet => value.id }
}


output "subnet_ids" {
  value = { for subnet, value in module.subnets : subnet => value.id }
}
