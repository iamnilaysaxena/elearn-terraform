output "rg_ids" {
  value = { for rg in azurerm_resource_group.rg : rg.name => rg.id }
}
