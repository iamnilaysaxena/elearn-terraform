output "op_networks" {
  value = { for vnet in azurerm_virtual_network.vnet : vnet.name => { for subnet in vnet.subnet : subnet.name => subnet.id } }
}
