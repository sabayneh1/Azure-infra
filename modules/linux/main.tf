
resource "azurerm_linux_virtual_machine" "vmlinux" {
  count                 = var.nb_count
  name                  = "${var.linux_name}${format("%1d", count.index + 1)}"
  resource_group_name   = var.linux_rg2
  location              = var.location
  size                  = var.vm_size
  network_interface_ids = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  computer_name         = "${var.linux_name}${format("%1d", count.index + 1)}"
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
    name                 = "${var.linux_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.Os_disk_attributes["los_disk_caching"]
    storage_account_type = var.Os_disk_attributes["los_storage_account_type"]
    disk_size_gb         = var.Os_disk_attributes["los_disk-size"]


  }

}

resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.linux_rg2
  # depends_on          = [azurerm_subnet_network_security_group_association.subnet_association]
  tags = local.common_tags


  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip${format("%1d", count.index + 1)}"
  resource_group_name = var.linux_rg2
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}${format("%1d", count.index + 1)}"
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



