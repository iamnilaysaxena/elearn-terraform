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

module "pips" {
  for_each            = var.vms
  source              = "../../modules/azurerm_public_ip"
  name                = each.key
  resource_group_name = module.resource_groups[local.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].resource_group_name].name
  location            = module.resource_groups[local.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].resource_group_name].location
  is_public_ip_needed = each.value.is_public_ip_needed
  tags                = var.tags
}

module "nics" {
  for_each             = var.vms
  source               = "../../modules/azurerm_network_interface"
  name                 = each.key
  resource_group_name  = module.resource_groups[local.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].resource_group_name].name
  location             = module.resource_groups[local.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].resource_group_name].location
  subnet_id            = module.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].id
  public_ip_address_id = module.pips[each.key].id
  tags                 = var.tags
}

module "vms" {
  for_each            = var.vms
  source              = "../../modules/azurerm_linux_virtual_machine"
  name                = each.key
  resource_group_name = module.resource_groups[local.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].resource_group_name].name
  location            = module.resource_groups[local.subnets["${each.value.virtual_network_name}-${each.value.subnet_name}"].resource_group_name].location
  size                = each.value.size
  public_key          = file(each.value.public_key)
  custom_data         = each.value.custom_data != null ? base64encode(file(each.value.custom_data)) : null
  nic_id              = module.nics[each.key].id
  tags                = var.tags
}
