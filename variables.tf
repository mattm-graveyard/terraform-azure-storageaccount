
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

variable "resource_group_location" {
  description = "Location"
  type = string
} 

variable "storage_account_name" {
  description = "Storage Account Name"
  type = string
}

variable "storage_account_tier" {
  description = "Tier of Storage Account"
  type = string
}

variable "storage_account_type" {
  description = "Account Replication Type"
  type = string
}

variable "public_network_access" {
  description = "Enabling Public Network Access"
  type = bool
}

variable "environment_tags" {
  description = "Environment Tags"
  type = string
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string
}

variable "vnet_cidr" {
  description = "The CIDR of the network vnet"
  type = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type = string
}

variable "subnet_address_prefixes" {
  description = "Address Prefixes for Subnet"
  type = string
}

variable "subnet_service_endpoints" {
  description = "Service Endpoints for Subnet"
  type = string
}

variable "private_endpoint_network_policies_enabled" {
  description = "Enable Private Endpoint Network Policies"
  type = bool
}

variable "publicip_name" {
  description = "Name of Public IP"
  type = string
}

variable "network_interface_name" {
  description = "Network Interface Name"
  type = string
}

variable "private_dns_zone_link" {
  description = "Link of Private DNS Zone"
  type = string
}

variable "private_dns_zone_vnlink_name" {
  description = "Name of DNS Zone Virtual Network Link"
  type = string
}

variable "azure_private_endpoint_name" {
  description = "Name of Azure Private Endpoint"
  type = string
}

variable "private_service_connection_name" {
  description = "Name of Private Service Connection"
  type = string
}