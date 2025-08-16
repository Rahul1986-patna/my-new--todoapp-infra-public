#i am dhondhu no.-
#kachara code- ye code sirf samajhne ke liye hai1
#this code is for understanding only

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "72a91b09-4e20-47bf-9db5-fe67dec70106"
}