
output "Virtual_network_name" {
  value = azurerm_virtual_network.vnet

}

output "address_space" {
  value = azurerm_virtual_network.vnet.address_space

}
output "Subnet_name1" {
  value = azurerm_subnet.subnet

}

output "Subnet_name2" {
  value = azurerm_subnet.subnet2

}

# output "Subnet_address1" {
#   value = azurerm_subnet.subnet.address_prefixes

# }

# output "Subnet_address2" {
#   value = azurerm_subnet.subnet2.address_prefixes

# }

output "subnet" {
  value = azurerm_subnet.subnet.id

}


output "subnet2_id" {
  value = azurerm_subnet.subnet2.id

}


# output "nsg1" {
#   value = azurerm_network_security_group.nsg

# }