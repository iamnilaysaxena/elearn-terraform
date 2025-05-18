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


variable "size" {
  type = string
}

variable "custom_data" {
  type = string
}

variable "public_key" {
  type = string
}

variable "nic_id" {
  type = string
}
