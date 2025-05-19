resource "azurerm_network_security_group" "nsg" {
  name                = "${var.name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = toset(var.inbound_ports)

    content {
      name                       = "CustomAllowPort${security_rule.value}"
      priority                   = 100 + index(var.inbound_ports, security_rule.value) * 10
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  tags = var.tags
}
