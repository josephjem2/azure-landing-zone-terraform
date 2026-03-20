variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "enable_bootstrap" {
  description = "If true, create bootstrap infrastructure (platform_state RG, monitoring RG, tfstate storage). Should be false for CI platform applies."
  type        = bool
  default     = false
}

variable "rg_platform_state_name" {
  description = "Resource group name for Terraform state backend"
  type        = string
  default     = "rg-platform-state"
}

variable "rg_platform_monitoring_name" {
  description = "Resource group name for platform monitoring resources"
  type        = string
  default     = "rg-platform-monitoring"
}

variable "tfstate_storage_account_name" {
  description = "Storage account name for Terraform remote state"
  type        = string
  default     = "sttfstatejoseph001"
}

variable "common_tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default = {
    environment = "platform"
    managed_by  = "terraform"
    owner       = "cloud-team"
  }
}