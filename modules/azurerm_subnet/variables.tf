variable "subnet_name" {
    description = "the name of the subnet"
    type = string
}
variable "resource_group_name" {
    description = "the name of the resource group"
    type = string
}
variable "virtual_network_name" {
    description = "the name of the virtual network"
    type = string
}

variable "address_prefixes" {
    description = "The address prefix for the subnet"
    type = list(string)
}

