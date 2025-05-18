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
    subnets             = ["web", "backend", "database"]
  }
}
