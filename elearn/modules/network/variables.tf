variable "networks" {
  type = map(object({
    resource_group_name = string
    address_space       = string
    subnets             = optional(list(string))
  }))
  description = "Resource Groups"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "resource_groups" {
  type = map(object({
    location = string
  }))
}
