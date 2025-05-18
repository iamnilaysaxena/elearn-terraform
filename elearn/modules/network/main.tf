resource "azurerm_virtual_network" "vnet" {
  for_each            = var.networks
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = var.resource_groups[each.value.resource_group_name].location
  address_space       = [each.value.address_space]
  tags                = var.tags


  dynamic "subnet" {
    for_each = each.value.subnets

    content {
      name             = "${each.key}-${subnet.key}"
      address_prefixes = [subnet.value.address_prefix]
    }
  }
}
