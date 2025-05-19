output "pip" {
  value = var.is_public_ip_needed ? azurerm_public_ip.pip[0].ip_address : null
}

output "id" {
  value = var.is_public_ip_needed ? azurerm_public_ip.pip[0].id : null
}
