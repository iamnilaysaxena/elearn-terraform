output "op_networks" {
  value = {
    for vnet in azurerm_virtual_network.vnet :
    vnet.name => {
      id : vnet.id
      subnets : { for subnet in vnet.subnet : subnet.name => subnet.id }
    }
  }
}
