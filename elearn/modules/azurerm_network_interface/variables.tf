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


variable "is_public_ip_needed" {
  type = bool
}

variable "subnet_id" {
  type = string
}
