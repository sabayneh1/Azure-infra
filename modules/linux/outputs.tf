output "Linux_hostname" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].name

}

output "Linux_private_ip_addresses" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].private_ip_address

}

output "Linux_public_ip_addresses" {
  value = [values(azurerm_linux_virtual_machine.vmlinux)[*].public_ip_addresses]

}


output "linux_domain_names" {
  value = [values(azurerm_public_ip.linux_pip)[*].fqdn]

}

output "linux_nic" {
  value = [values(azurerm_network_interface.linux_nic)[*].id]

}

output "linux_virtual_machine_ids" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].id

}


output "network_interface_id" {
  value = values(azurerm_network_interface.linux_nic)[*].id
  
}

output "domain_name_label" {
  value = values(azurerm_public_ip.linux_pip)[*].id

}