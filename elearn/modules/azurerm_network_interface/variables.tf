variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}
