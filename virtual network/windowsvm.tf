# Resource : Azure windows virtual machine

resource "azurerm_windows_virtual_machine" "mywindowsvm" {
    name = "mywindwsvm-1"
    computer_name = "stagwindows-vm1" #Hostname of the VM
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    size = "Standard_F2"
    admin_username = "azureuser"
    network_interface_ids = [azurerm_network_interface.myvm1nic.id]
    admin_password = "Password@123"
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = {
    "Name"="myvent-1"
    "Environment" = "demo"
    "lob":"man"
    "app_name":"google"
    "bu":"sun"
  }
}