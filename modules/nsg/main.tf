
module "nsg_rules" {
  source = "./nsg-rules"


  for_each                   = { for rules in var.nsg_rules : rules.name => rules }
  name                       = each.value.name
  access                     = each.value.access
  resource_group             = each.value.resource_group
  protocol                   = each.value.protocol
  direction                  = each.value.direction
  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range
  priority                   = each.value.priority
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix
  nsg_name                   = each.value.nsg_name

  depends_on = [module.nsg_creation]
}


module "nsg_creation" {
  source = "./nsg-creation"

  for_each       = { for configs in var.nsg : configs.name => configs }
  name           = each.value.name
  resource_group = each.value.resource_group
  subnet         = each.value.subnet
  vnet_name      = each.value.vnet_name

}
