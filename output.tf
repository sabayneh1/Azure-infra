
# output "rg2" {
#   value = module.resouce_group.rg2

# }

output "Virtual_network_name" {
  value = module.network.Virtual_network_name

}

# output "nsg1" {
#   value = module.network.nsg1

# }

output "Subnet1" {
  value = module.network.Subnet_name1

}

output "Subnet2" {
  value = module.network.Subnet_name2

}

output "Linux_hostname" {
  value = module.linux.Linux_hostname

}

output "Linux_private_ip_addresses" {
  value = module.linux.Linux_private_ip_addresses

}

output "Linux_public_ip_addresses" {
  value = module.linux.Linux_public_ip_addresses

}

output "Linux_domain_names" {
  value = module.linux.linux_domain_names

}



# output "windows_domain_names" {
#   value = module.windows.windows_domain_names

# }

output "windows_hostname" {
  value = module.windows.windows_hostname

}

output "windows_private_ip_addresses" {
  value = module.windows.windows_private_ip_addresses

}

output "windows_public_ip_addresses" {
  value = module.windows.windows_public_ip_addresses

}

