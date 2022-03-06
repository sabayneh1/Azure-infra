# resource "null_resource" "linux_provisioner" {
#   count = var.nb_count
#   depends_on = [
#     azurerm_linux_virtual_machine.vmlinux,
#     azurerm_network_interface.linux_nic,
#   ]


#   provisioner "remote-exec" {
#     inline = [
#       "/usr/bin/hostname",
#     ]

#     connection {

#       type        = "ssh"
#       user        = var.Admin_user_name
#       private_key = file(var.priv_key)
#       # host = var.linux_name
#       host = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)
#       # host = element(azurerm_linux_virtual_machine.vmlinux[*].public_ip_addresses, count.index + 1 )



#     }



#   }

# }


resource "null_resource" "linux_provisioner" {

  count = var.nb_count

  depends_on = [

    azurerm_linux_virtual_machine.vmlinux,
    # azurerm_network_security_group.nsg

  ]

  provisioner "remote-exec" {

    inline = [

      "cat /etc/os-release"

    ]

    connection {

      type = "ssh"

      user = var.Admin_user_name
      #    agent = true

      private_key = file(var.priv_key)
      timeout     = "45"

      host = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)


    }

  }

}