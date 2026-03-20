variable "location" {
  default = "eastus"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "platform"
    owner       = "cloud-team"
    managed_by  = "terraform"
  }
}