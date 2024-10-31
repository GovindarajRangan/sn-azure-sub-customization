variable "subscription_id" {
  description = "Subscription ID"
  type = string
}

### Common tags

variable "common_tags" {
  description = "List of tags for lennar"
  type        = map(string)
}

### Virtual Network

variable "vnets" {
  description = "Azure virtual networks"
  type = list(object({
    name                = string
    address_space       = list(string)
    resource_group_name = string
    dns_servers         = list(string)
  }))
}

### Resource Group

variable "resource_groups" {
  description = "Azure resource group"
  type = list(object({
    rg_name  = string
    location = string
  }))
}

### Subnets

variable "subnets" {
  description = "Azure Subnets"
  type = list(object({
    name                 = string
    virtual_network_name = string
    address_prefixes     = list(string)
    resource_group_name  = string
  }))
}

### NSG

variable "nsg" {
  description = "Azure Network Security Group"
  type = list(object({
    name           = string
    resource_group = string
    subnet         = string
    vnet_name      = string
  }))

}

### NSG rules

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



### Route Tables

variable "route_tables" {
  type = list(object({
    name                          = string
    resource_group_name           = string
    disable_bgp_route_propagation = bool
    subnet                        = string
    vnet_name                     = string
    routes = list(object({
      name           = string
      address_prefix = string
      next_hop_type  = string
    }))
  }))

}

### Budget

variable "budget_details" {
  type = list(object({
    name          = string
    budget_amount = number
    time_grain    = string
    start_date    = string
    end_date      = string
    notifications = list(object({
      threshold      = number
      operator       = string
      contact_emails = list(string)
      contact_roles  = list(string)
      threshold_type = string
      enabled        = bool
    }))
  }))
}

variable "role_definitions" {
  type = list(object({
    role_definition_name = string
    scope                = string
    actions              = list(string)
    not_actions          = list(string)
    assignable_scopes    = list(string)
  }))
}


variable "role_assignments" {
  type = list(object({
    name                   = string
    role_definition_name   = string
    principal_id           = string
    scope                  = string
    custom_role_definition = bool
  }))
}