variable "prefix" {
  type        = string
  description = "Prefix all resources"
  default     = "TFCLOUDDEMO062022"
}

variable "app_service_sku" {
  type        = string
  description = "SKU for App service."
  default     = "P1v2"
  validation {
    condition     = var.app_service_sku == "P1v2" || var.app_service_sku == "P1v2"
    error_message = "Only B1 or P1v2 are accepted."
  }
}