variable "tags" {
  default = {}
}

variable "resource_groups" {
  type = map(object({
    location = string
  }))
  description = "Resource Groups"
}

variable "vms" {
  type = map(object({
    virtual_network_name = string
    subnet_name          = string
    size                 = string
    is_public_ip_needed  = optional(bool, false)
    custom_data          = optional(string)
    public_key           = string
    inbound_ports        = optional(list(string))
  }))
}

variable "virtual_networks" {
  type = map(object({
    resource_group_name = string
    address_space       = string
    subnets = map(object({
      address_prefix = string
    }))
  }))
  description = "Resource Groups"
}

