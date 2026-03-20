provider "azurerm" {
  features {}
}

# -----------------------------
# BOOTSTRAP (only in bootstrap.tfstate)
# -----------------------------
resource "azurerm_resource_group" "platform_state" {
  count    = var.enable_bootstrap ? 1 : 0
  name     = var.rg_platform_state_name
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "platform_monitoring" {
  count    = var.enable_bootstrap ? 1 : 0
  name     = var.rg_platform_monitoring_name
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_storage_account" "tfstate" {
  count                    = var.enable_bootstrap ? 1 : 0
  name                     = var.tfstate_storage_account_name
  resource_group_name      = azurerm_resource_group.platform_state[0].name
  location                 = azurerm_resource_group.platform_state[0].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.common_tags
}

# -----------------------------
# PLATFORM RESOURCES (only in platform.tfstate)
# Put your real landing zone resources here (NOT bootstrap)
# -----------------------------

# Example placeholder:
# resource "azurerm_log_analytics_workspace" "platform" {
#   name                = "law-platform"
#   location            = var.location
#   resource_group_name = var.rg_platform_monitoring_name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags                = var.common_tags
# }