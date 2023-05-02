resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = var.network_interface_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                  = var.virtual_machine_name
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  size                  = var.virtual_machine_size

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_profile {
    computer_name  = var.virtual_machine_name
    admin_username = var.virtual_machine_admin_username
    admin_password = var.virtual_machine_admin_password
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.virtual_machine_iso_publisher
    offer     = var.virtual_machine_iso_offer
    sku       = var.virtual_machine_iso_sku
    version   = var.virtual_machine_iso_version
  }
}