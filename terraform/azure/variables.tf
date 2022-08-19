variable "prefix" {
  type        = string
  description = "Prefix all resources"
  default     = "TFCLOUDDEMO062022"
}

variable "app_service_sku" {
  type        = string
  description = "SKU for App service. Defaults to B1, P1v3 is other option"
  default     = "B1"
  validation {
    condition     = var.app_service_sku == "B1" || var.app_service_sku == "P1v3"
    error_message = "Only B1 or P1v3 are accepted."
  }
}