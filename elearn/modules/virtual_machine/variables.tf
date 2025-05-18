variable "networks" {
  type = map(object({
    resource_group_name = string
    address_space       = string
    subnets = map(object({
      address_prefix = string
    }))
  }))
  description = "Resource Groups"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "vms" {
  type = map(object({
    virtual_network_name = string
    subnet_name          = string
    size                 = string
    is_public_ip_needed  = optional(bool)
  }))
}

variable "network_ids" {
  type = map(
    object({
      id      = string
      subnets = map(string)
    })
  )
}

variable "resource_groups" {
  type = map(object({
    location = string
  }))
}
