# ame                = each.value.name
#   address_space       = each.value.address_space
#   resource_group_name = each.value.resource_group_name

variable "name" {
  description = ""
  type        = string
}

variable "resource_group_name" {
  description = ""
  type        = string
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type = list(string)
}