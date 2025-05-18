variable "resource_groups" {
  type = map(object({
    location = string
  }))
  description = "Resource Groups"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}
