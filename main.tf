
## Resource Groups

module "resource_groups" {
  source = "./modules/resource-groups"

  for_each = { for rg in var.resource_groups : rg.rg_name => rg }
  rg_name  = each.value.rg_name
  location = each.value.location
}

### Virtual Networks

module "vnets" {
  source = "./modules/virtual-networks"

  for_each            = { for vnets in var.vnets : vnets.name => vnets }
  name                = each.value.name
  address_space       = each.value.address_space
  resource_group_name = each.value.resource_group_name
  dns_servers         = each.value.dns_servers


  depends_on = [module.resource_groups]
}

### Subnets

module "subnets" {
  source = "./modules/subnets"

  for_each             = { for subnets in var.subnets : subnets.name => subnets }
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  resource_group_name  = each.value.resource_group_name

  depends_on = [module.vnets]
}

### Network Security Group / Rules

module "nsg" {
  source = "./modules/nsg"

  nsg_rules = var.nsg_rules
  nsg       = var.nsg

  depends_on = [module.resource_groups, module.vnets, module.subnets]
}

### Route Tables

module "route_tables" {
  source = "./modules/route-tables"

  for_each = { for routes in var.route_tables : routes.name => routes }

  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  disable_bgp_route_propagation = each.value.disable_bgp_route_propagation
  subnet                        = each.value.subnet
  vnet_name                     = each.value.vnet_name
  routes                        = each.value.routes

  depends_on = [module.vnets, module.subnets]

}


### Azure Budget

module "budget" {
  source = "./modules/budget"

  for_each            = { for budgets in var.budget_details : budgets.name => budgets }
  name                = each.value.name
  budget_amount       = each.value.budget_amount
  time_grain          = each.value.time_grain
  start_date          = each.value.start_date
  end_date            = each.value.end_date
  notifications       = each.value.notifications

}

module "vms" {
  source = "./modules/vm"

  for_each = { for vm in var.virtual_machines : vm.vm_hostname => vm}
  vm_hostname = each.value.vm_hostname
  os_disk_size = each.value.os_disk_size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  resource_group_name = each.value.resource_group_name
  vnet_name = each.value.vnet_name
  subnet_name = each.value.subnet_name
}



### RBAC Roles

# module "rbac" {
#   source = "../modules/rbac"

#   role_definitions = var.role_definitions
#   role_assignments = var.role_assignments

# }
