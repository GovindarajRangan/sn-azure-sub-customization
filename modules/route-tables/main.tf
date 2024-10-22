
data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_route_table" "route_table" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = data.azurerm_resource_group.resource_group.location

  dynamic "route" {
    for_each = var.routes
    content {
      name           = route.value.name
      address_prefix = route.value.address_prefix
      next_hop_type  = route.value.next_hop_type
    }
  }


}

resource "azurerm_subnet_route_table_association" "subnet_rt_association" {
  subnet_id      = data.azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}