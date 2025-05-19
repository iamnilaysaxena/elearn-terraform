resource "azurerm_public_ip" "pip" {
  count               = var.is_public_ip_needed ? 1 : 0
  name                = "${var.name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  tags                = var.tags
}
