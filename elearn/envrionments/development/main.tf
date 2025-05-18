# Resource Groups

module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
  tags            = var.tags
}
