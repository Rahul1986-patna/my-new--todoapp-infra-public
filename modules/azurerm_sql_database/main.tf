resource "azurerm_mssql_database" "sql_database" {
  name         = data.azurerm_mssql_database.sql_database.name
  server_id    = var.sql_server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"

}

