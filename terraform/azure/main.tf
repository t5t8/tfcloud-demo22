resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-main"
  location = "westeurope"
}