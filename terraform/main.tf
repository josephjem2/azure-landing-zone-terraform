resource "azurerm_resource_group" "platform_state" {
  name     = "rg-platform-state"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "platform_monitoring" {
  name     = "rg-platform-monitoring"
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "sttfstatejoseph001"
  resource_group_name      = azurerm_resource_group.platform_state.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}