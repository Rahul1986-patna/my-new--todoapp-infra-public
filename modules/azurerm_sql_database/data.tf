data "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = var.sql_server_id
}
