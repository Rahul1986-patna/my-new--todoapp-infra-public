variable "virtual_network_name" {
    description = "the name of the virtual network"
    type = string
}

variable "virtual_network_location" {
    description = "the location of the virtual network"
    type = string
}
variable "resource_group_name" {
    description = "the name of the resource group where group where the virtual network will be created"
    type = string
}
 variable "address_space" {
    description = "the address space of the virtual network"
    type = list(string)
 } 