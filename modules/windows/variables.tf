locals {

  common_tags = {
    Name         = "Terraform-Class"
    project      = "Learing"
    ContactEmail = "n01516507@humber.ca"
    Environment  = "Lab"
  }
}


variable "windows_name" {
  # type = map(string)
  # default = {
  #   lab-web-w-vm1 = "standard_b1s"
  #   lab-web-w-vm2 = "standard_b1ms"
  # }

}

variable "vm_size" {
  default = "Standard_B1s"

}
variable "Admin_user_name" {
  default = "n01516507"

}

variable "pub_key" {
  default = "/home/n01516507/.ssh/id_rsa.pub"

}

variable "Os_disk_attributes" {
  type = map(string)
  default = {
    los_storage_account_type = "StandardSSD_LRS"
    los_disk-size            = "127"
    los_disk_caching         = "ReadWrite"
  }

}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"

}
variable "windows_offer" {
  default = "WindowsServer"

}
variable "windows_sku" {
  default = "2016-Datacenter"

}

variable "windows_version" {
  default = "latest"

}

variable "windows_avs" {
  # default = "windows_avs"

}

variable "subnet2" {

}

variable "win_rg2" {

}

variable "location" {

}

# variable "resource_group" {
# }
