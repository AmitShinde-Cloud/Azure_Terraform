# Resource: Azure Linux Virtual Machine

resource "azurerm_linux_virtual_machine" "mylinuxvm" {
    name = "mylinuxvm-1"
    computer_name = "staginglinux-vm1"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    size = "Standard_DS1_v2"
  admin_username = "azureuser"
  admin_password = "Password@123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.myvm1nic.id
  ]
  
  os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_reference {
  publisher = "RedHat"
  offer = "RHEL"
  sku = "83-gen2"
  version = "latest"

}

tags = {
    "Environment" = "demo"
    "lob":"man"
    "app_name":"google"
    "bu":"sun"
}

}