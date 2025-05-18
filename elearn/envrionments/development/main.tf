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
