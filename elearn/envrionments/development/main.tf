# Resource Groups

module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
  tags            = var.tags
}


module "network" {
  depends_on      = [module.resource_group]
  source          = "../../modules/network"
  networks        = var.networks
  tags            = var.tags
  resource_groups = var.resource_groups
}

module "virtual_machine" {
  source          = "../../modules/virtual_machine"
  vms             = var.vms
  tags            = var.tags
  networks        = var.networks
  network_ids     = module.network.op_networks
  resource_groups = var.resource_groups
}
