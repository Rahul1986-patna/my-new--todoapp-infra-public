variable "public_ip_name" {
    description = "the name of the virtual network"
    type = string
}

variable "location" {
    description = "the azure region where the puvlic IP will be created"
    type = string
}
variable "resource_group_name" {
    description = "the name of the resource group where group where the virtual network will be created"
    type = string
}
 variable "allocation_method" {
    description = "the allocation method for the public IP address. Can be 'Static' or 'Dynamic'"
  type  = string
  default = "Static"
 }