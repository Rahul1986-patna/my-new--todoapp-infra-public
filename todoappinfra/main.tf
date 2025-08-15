#i am dhondhu no.1
#kachara code- ye code sirf samajhne ke liye hai

module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "todoapp-rg"
  resource_group_location = "central india"

}
module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../modules/azurerm_virtual_network"
  virtual_network_name     = "todovnetapp"
  virtual_network_location = "central india"
  resource_group_name      = "todoapp-rg"
  address_space            = ["10.0.0.0/16"]
}

module "frontend-subnet" {
  depends_on           = [module.virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  resource_group_name  = "todoapp-rg"
  virtual_network_name = "todovnetapp"
  address_prefixes     = ["10.0.1.0/24"]
}
module "backend-subnet" {
  depends_on           = [module.virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "backend-subnet"
  resource_group_name  = "todoapp-rg"
  virtual_network_name = "todovnetapp"
  address_prefixes     = ["10.0.2.0/24"]
}

module "public_ip_frontend" {
source = "../modules/azurerm_public_ip"
public_ip_name = "pip-todoapp_frontend"
 resource_group_name = "todoapp-rg"
 location = "central india"
 allocation_method = "Static"
}


module "public_ip_backend" {
source = "../modules/azurerm_public_ip"
public_ip_name = "pip-todoapp_backend"
 resource_group_name = "todoapp-rg"
 location = "central india"
 allocation_method = "Static"
}
module "frontend-vm" {
  depends_on               = [module.frontend-subnet]
  source                   = "../modules/azurerm_virtual_machine"
  resource_group_name      = "todoapp-rg"
  location                 = "central india"
  vm_name                  = "vm-frontend"
  vm_size                  = "Standard_B1s"
  admin_username           = "deveopsinsider"
  admin_password           = "Rahuljha@1210"
  image_publisher          = "Canonical"
  image_offer              = "0001-com-ubuntu-server-jammy"
  image_sku                = "22_04-lts-gen2"
  image_version            = "latest"
  nic_name                 = "nic-vm-frontend"
  frontend_ip_name = "pip-todoapp_frontend"
  virtual_network_name = "todovnetapp"
  frontend_subnet_name = "frontend-subnet"
}

#module "backend-vm" {
 # depends_on               = [module.backend-subnet]
 # source                   = "../modules/azurerm_virtual_machine"
  #resource_group_name      = "todoapp-rg"
  #location                 = "central india"
  #vm_name                  = "vm-backend"
  #vm_size                  = "Standard_B1s"
  #admin_username           = "deveopsinsider"
  #admin_password           = "Rahuljha@1210"
  #image_publisher          = "Canonical"
  #image_offer              = "0001-com-ubuntu-server-focal"
  #image_sku                = "20_04-lts"
  #image_version            = "latest"
  #nic_name                 = "nic-vm-backend"
  #subnet_id                = "/subscriptions/72a91b09-4e20-47bf-9db5-fe67dec70106/resourceGroups/todoapp-rg/providers/Microsoft.#Network/virtualNetworks/todovnetapp/subnets/backend-subnet" 
  #public_ip_id = "/subscriptions/72a91b09-4e20-47bf-9db5-fe67dec70106/resourceGroups/todoapp-rg/providers/Microsoft.Network/#publicIPAddresses/pip-todoapp_backend"
#}
module "sql-server" {
  source                   = "../modules/azurerm_sql_server"
  sql_server_name          = "sqlserver-todoapp"
  resource_group_name      = "todoapp-rg"
  location                 = "central india"
  administrator_login      = "sqladmin"
  administrator_login_password = "Rahuljha@1210"
}
module "sql-database" {
  depends_on              = [module.sql-server]
  source                   = "../modules/azurerm_sql_database"
  sql_database_name = "tododb"
  sql_server_id = module.sql-server.sql_server_id
}
module "key-vault" {
  depends_on               = [module.resource_group]
  source                   = "../modules/azurerm_key_vault"
  key_vault_name           = "kv-todoapp"
  resource_group_name      = "todoapp-rg"
  location                 = "central india"
}

