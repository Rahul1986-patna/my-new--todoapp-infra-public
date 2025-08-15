data "azurerm_subnet" "frontend_subnet" {
  name                 = var.frontend_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}

data "azurerm_public_ip" "public_ip" {
  name                = var.frontend_ip_name
  resource_group_name = var.resource_group_name
}
data "azurerm_key_vault" "key_vault" {
  name                = "kv-todoapp"
  resource_group_name = "todoapp-rg"
}
data "azurerm_key_vault_secret" "example" {
  name         = "secret-sauce"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}