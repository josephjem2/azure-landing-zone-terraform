terraform {
  backend "azurerm" {
    resource_group_name  = "rg-platform-state"
    storage_account_name = "sttfstatejoseph001"
    container_name       = "tfstate"
    key                  = "platform.tfstate"
  }
}