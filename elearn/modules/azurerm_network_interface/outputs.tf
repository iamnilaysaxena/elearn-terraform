output "id" {
  value = azurerm_network_interface.nic.id
}

output "pip" {
  value = var.is_public_ip_needed ? azurerm_public_ip.pip[0].ip_address : null
}
