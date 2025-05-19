output "id" {
  value = azurerm_network_interface.nic.id
}

output "privateip" {
  value = azurerm_network_interface.nic.private_ip_address
}

