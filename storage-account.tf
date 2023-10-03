resource "azurerm_storage_account" "storage" {
  name = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = azurerm_resource_group.myrg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_type
  public_network_access_enabled = var.public_network_access

 network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.subnet_resource.id]
  }

  tags = {
    environment = var.environment_tags
  }
}

resource "azurerm_private_dns_zone" "dns-zone" {
  name                = var.private_dns_zone_link
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "network_link" {
  name                  = var.private_dns_zone_vnlink_name
  resource_group_name   = azurerm_resource_group.myrg.name
  private_dns_zone_name = azurerm_private_dns_zone.dns-zone.name
  virtual_network_id    = azurerm_virtual_network.myvnet.id
}

resource "azurerm_private_endpoint" "endpoint" {
  name                = var.azure_private_endpoint_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  subnet_id           = azurerm_subnet.subnet_resource.id
  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}