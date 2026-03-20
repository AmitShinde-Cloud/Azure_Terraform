provider "azurerm" {
  features {}
  
}




resource "azurerm_network_interface" "nic" {
  name                = var.nic
  location            = var.location
resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.vm_ipconfig
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}
resource "azurerm_public_ip" "public_ip" {
  name                = "publicIp-1"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}
resource "azurerm_virtual_machine" "vms" {
  name                  = var.vm_name
  location            = var.location
resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size
  storage_os_disk {
name              = var.disk_name
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  storage_image_reference {
   publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password  
  }
  
   os_profile_windows_config {
    enable_automatic_upgrades = false
  }
}
