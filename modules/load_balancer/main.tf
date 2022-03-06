resource "azurerm_lb" "assignment1" {
  name                = "lb-assignment1-6507"
  location            = var.location
  resource_group_name = var.rg2
  frontend_ip_configuration {
    name                 = "PublicIPAddress-6507"
    public_ip_address_id =  var.public_ip_address_id
  }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = var.rg2
  loadbalancer_id     = azurerm_lb.assignment1.id
  name                = "BackEndAddressPool-6507"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_pool_association" {
  network_interface_id    = var.linux_nic.id 
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.rg2
  loadbalancer_id                = azurerm_lb.assignment1.id
  name                           = "LBRule-6507"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress" 
}

resource "azurerm_lb_probe" "lb_prob" {
  resource_group_name = var.rg2
  loadbalancer_id     = azurerm_lb.assignment1.id
  # name                = "ssh-running-probe-6507"
  # port                = 22
  name                = "tcpProbe"
  protocol            = "tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}