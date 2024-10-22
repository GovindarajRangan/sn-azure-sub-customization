
variable "name" {
  description = "NSG Rule Name"
  type        = string
}

variable "access" {
  description = "Access type"
  type        = string
}

variable "protocol" {
  description = "NSG Protocol"
  type        = string
}

variable "source_port_range" {
  description = "NSG Rule Source port Range"
  type        = string
}

variable "destination_port_range" {
  description = "NSG Rule Destination port Range"
  type        = string
}

variable "priority" {
  description = "NSG Rule Priority"
  type        = string
}

variable "destination_address_prefix" {
  description = "NSG Rule destination address prefix"
  type        = string
}

variable "nsg_name" {
  description = "NSG name"
  type        = string
}


variable "direction" {
  description = "NSG Rule direction Inbound/Outbound"
  type        = string
}

variable "resource_group" {
  description = "NSG Rule resource group"
  type        = string
}

variable "source_address_prefix" {
  description = "NSG rule source address prefix"
  type        = string
}