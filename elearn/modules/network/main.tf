resource "azurerm_virtual_network" "vnet" {
  for_each            = var.networks
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = var.resource_groups[each.value.resource_group_name].location
  address_space       = [each.value.address_space]
}
