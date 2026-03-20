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