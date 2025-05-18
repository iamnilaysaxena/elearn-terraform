tags = {
  environment = "development"
  app         = "elearn"
}

resource_groups = {
  rg-rudra-elearn = {
    location = "Central India"
  }
}

networks = {
  vnet1 = {
    resource_group_name = "rg-rudra-elearn"
    address_space       = "10.60.0.0/16"
    subnets = {
      web = {
        address_prefix = "10.60.0.0/24"
      }
      backend = {
        address_prefix = "10.60.1.0/24"
      }
      database = {
        address_prefix = "10.60.2.0/24"
      }
    }
  }
}
