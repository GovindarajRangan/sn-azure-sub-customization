
data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  address_space       = var.address_space
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = var.resource_group_name

}

resource "azurerm_virtual_network_dns_servers" "vnet_dns_servers" {
  virtual_network_id = azurerm_virtual_network.virtual_network.id
  dns_servers        = var.dns_servers

}