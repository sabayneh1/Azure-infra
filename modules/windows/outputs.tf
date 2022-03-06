output "windows_hostname" {
  value = values(azurerm_windows_virtual_machine.vmWin)[*].name

}

output "windows_private_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.vmWin)[*].private_ip_address

}

output "windows_public_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.vmWin)[*].public_ip_addresses

}


# output "windows_domain_names" {

#   value = azurerm_public_ip.windwos_pip[*].fqdn

# }

# output "windows_pip" {
#   value = azurerm_public_ip.windows_pip

# }