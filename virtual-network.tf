resource "azurerm_virtual_network" "myvnet" {
  name                = var.virtual_network_name
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "subnet_resource" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = [var.subnet_address_prefixes]
  service_endpoints = [ var.subnet_service_endpoints ]
  private_endpoint_network_policies_enabled = true
}

resource "azurerm_public_ip" "mypublicip" {
  name = var.publicip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label = "app1-${random_string.myrandom.id}"  
}

resource "azurerm_network_interface" "myvmnic" {
  name = var.network_interface_name
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_resource.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}