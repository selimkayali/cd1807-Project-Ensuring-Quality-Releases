resource "azurerm_network_interface" "" {
  name                = ""
  location            = ""
  resource_group_name = ""

  ip_configuration {
    name                          = "internal"
    subnet_id                     = ""
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = ""
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                  = ""
  location              = ""
  resource_group_name   = ""
  size                  = "Standard_DS2_v2"
  admin_username        = ""
  network_interface_ids = []
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUfrbF0Oco9I8GtJax7rB51qojqrrTz+hT9/4VPZubF84q/A1XOhBPdUEC6C3qeFqrKLiGt/dRndw3dPa+DWFoZB7+rPH/2BVtNG645RSqt/qVbTHS4Tx30VI/cdsrhmGzk/aesJpSuk7tCwjbgsv9n8jp0ZM5sbBNUn6T65p+f2SexYJXyst1wf7G8pvHuhJudkmMy90yLVaI7IDCVKNoSFEC6gQz0vv9M5ayxOOCkYycUXq9D7eW8h69hpdgeU10bTcsF+6MPljb2Krz1Et2KT3o0mtiqKbhZIgbsjJ1l/zOWo2n7Sg9UKdpfFNyd9njzTm1XpvRudkxUWxTU90Lri+jiKx7zBmWLLeC0myN3235KP+POUZS3ChvaeXqTgr9Gl/POeJbfReU6beeSQ21uvHFe4Br/M8C2qzfUDDNWHcBZeYCycniWqldRl04CHIEavhdpPVTccm0mssjorE7VZ83qfJsNwtkFi6axC8+Ys2CA9y3Myd072mjlCh94p8="
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
