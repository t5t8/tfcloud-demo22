resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-main"
  location = "westeurope"
}


## Example webapp plan
resource "azurerm_service_plan" "demo" {
  name                = "${var.prefix}-plan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = var.app_service_sku
}