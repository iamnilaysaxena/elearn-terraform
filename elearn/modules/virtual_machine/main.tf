resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = "${each.key}-nic"
  resource_group_name = var.networks[each.value.virtual_network_name].resource_group_name
  location            = var.resource_groups[var.networks[each.value.virtual_network_name].resource_group_name].location

  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = var.network_ids[each.value.virtual_network_name].subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"]
    private_ip_address_allocation = "Dynamic"
  }
}
