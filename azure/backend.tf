terraform {
  backend "azurerm" {
    resource_group_name  = "hackathon-rg"
    storage_account_name = "hackathonsajulianddd"
    container_name       = "julianddd-tfstate"
    key                  = "julianddd-tfstate"
  }
}