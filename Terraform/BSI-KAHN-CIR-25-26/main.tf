resource "azurerm_resource_group" "limayrac" {
  name     = "limayrac-rg"
  location = "West Europe"
  tags = {
    environment = "Terraform"
    project     = "Terraform"
    owner       = "Alex FAIVRE"
  }
}

resource "azurerm_virtual_network" "limayrac" {
  name                = "limayrac-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name
  tags = {
    environment = "Terraform"
    project     = "Terraform"
    owner       = "Alex FAIVRE"
  }
}

resource "azurerm_subnet" "limayrac" {
  name                 = "limayrac-subnet"
  resource_group_name  = azurerm_resource_group.limayrac.name
  virtual_network_name = azurerm_virtual_network.limayrac.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "limayrac" {
  name                = "limayrac-nsg"
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name

  dynamic "security_rule" {
    for_each = [
      {
        name                   = "allow-ssh"
        priority               = 1000
        destination_port_range = 22
      },
      {
        name                   = "allow-http"
        priority               = 1001
        destination_port_range = 80
      }
    ]
    
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

}
resource "azurerm_subnet_network_security_group_association" "limayrac" {
  subnet_id                 = azurerm_subnet.limayrac.id
  network_security_group_id = azurerm_network_security_group.limayrac.id
}

resource "azurerm_public_ip" "limayrac" {
  name                = "limayrac-public-ip"
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "limayrac" {
  name                = "limayrac-nic"
  location            = azurerm_resource_group.limayrac.location
  resource_group_name = azurerm_resource_group.limayrac.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.limayrac.id
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.limayrac.id
  }
}

resource "azurerm_linux_virtual_machine" "limayrac" {
  name                            = "limayrac-vm"
  location                        = azurerm_resource_group.limayrac.location
  resource_group_name             = azurerm_resource_group.limayrac.name
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.limayrac.id,
  ]
  size           = "Standard_DS1_v2"
  admin_username = "adminuser"
  admin_password = ""
  computer_name  = "limayrac-vm"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}