locals {
  subnets = merge([
    for vnet_key, vnet_value in var.virtual_networks :
    {
      for subnet_name, subnet_value in vnet_value.subnets :
      "${vnet_key}-${subnet_name}" => merge(subnet_value, {
        "vnet" : vnet_key,
        "resource_group_name" : vnet_value.resource_group_name
      })
    }
  ]...)
}

module "resource_groups" {
  for_each = var.resource_groups
  source   = "../../modules/azurerm_resource_group"
  name     = each.key
  location = each.value.location
  tags     = var.tags
}


module "virtual_networks" {
  for_each            = var.virtual_networks
  source              = "../../modules/azurerm_virtual_network"
  name                = each.key
  resource_group_name = module.resource_groups[each.value.resource_group_name].name
  location            = module.resource_groups[each.value.resource_group_name].location
  address_space       = each.value.address_space
  tags                = var.tags
}

module "subnets" {
  for_each             = local.subnets
  source               = "../../modules/azurerm_subnet"
  name                 = each.key
  resource_group_name  = each.value.resource_group_name
  address_prefixes     = each.value.address_prefix
  virtual_network_name = module.virtual_networks[each.value.vnet].name
}
