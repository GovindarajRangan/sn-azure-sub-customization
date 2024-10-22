
data "azurerm_resource_group" "resource_group" {
  name = var.resource_group
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = var.name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
}


resource "azurerm_subnet_network_security_group_association" "nsg_subnet_association" {
  network_security_group_id = azurerm_network_security_group.network_security_group.id
  subnet_id                 = data.azurerm_subnet.subnet.id

}