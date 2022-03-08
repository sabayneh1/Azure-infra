
resource "azurerm_linux_virtual_machine" "vmlinux" {
  for_each              = var.linux_name
  name                  = each.key
  resource_group_name   = var.linux_rg2
  location              = var.location
  size                  = var.vm_size
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  computer_name         = each.key
  availability_set_id   = azurerm_availability_set.linux_avs.id
  admin_username        = var.Admin_user_name
  tags                  = local.common_tags
  depends_on            = [azurerm_availability_set.linux_avs]


  admin_ssh_key {
    username   = var.Admin_user_name
    public_key = file("/home/n01516507/.ssh/id_rsa.pub")
  }




  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }


  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.Os_disk_attributes["los_disk_caching"]
    storage_account_type = var.Os_disk_attributes["los_storage_account_type"]
    disk_size_gb         = var.Os_disk_attributes["los_disk-size"]


  }

}

resource "azurerm_network_interface" "linux_nic" {
  for_each        = var.linux_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.linux_rg2
  # depends_on          = [azurerm_subnet_network_security_group_association.subnet_association]
  tags = local.common_tags


  ip_configuration {
    name                          = "${each.key}-ipconfig1"
    subnet_id                     = var.subnet
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.linux_name
  name                = "${each.key}-pip"
  resource_group_name = var.linux_rg2
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = each.key
  # depends_on          = [var.rg2]
  tags = local.common_tags



}


resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.linux_rg2
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
  # depends_on                   = [var.rg2]


}



