tags = {
  environment = "development"
  app         = "elearn"
}

resource_groups = {
  rg-rudra-elearn = {
    location = "East US"
  }
}

virtual_networks = {
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

vms = {
  web-vm = {
    virtual_network_name = "vnet1"
    subnet_name          = "web"
    size                 = "Standard_B1s"
    is_public_ip_needed  = true
    custom_data          = "../../../scripts/nginx.sh"
    public_key           = "../../../keys/vm.pub"
    inbound_ports        = [80, 443]
  }
  # backend-vm = {
  #   virtual_network_name = "vnet1"
  #   subnet_name          = "backend"
  #   size                 = "Standard_B1s"
  # }
}

storage_accounts = {
  sa6060 = {
    resource_group_name      = "rg-rudra-elearn"
    account_replication_type = "LRS"
  }
}
