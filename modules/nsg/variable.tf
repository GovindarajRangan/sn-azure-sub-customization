variable "nsg" {
  description = "Azure Network Security Group"
  type = list(object({
    name           = string
    resource_group = string
    subnet         = string
    vnet_name      = string
  }))
}

variable "nsg_rules" {
  description = "Azure network security group rules"
  type = list(object({
    name                       = string
    access                     = string
    protocol                   = string
    direction                  = string
    source_port_range          = string
    destination_port_range     = string
    priority                   = string
    source_address_prefix      = string
    destination_address_prefix = string
    nsg_name                   = string
    resource_group             = string
  }))
}