output "op_resource_groups" {
  value = { for rg in azurerm_resource_group.rg : rg.name => rg.id }
}
