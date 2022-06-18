variable "min" {
  type        = string
  description = "Integer minimum value"
  default     = 1
  validation {
    condition     = var.min < 9 && var.min > 0
    error_message = "Maximum value must be between 1 and 8"
  }
}

variable "max" {
  type        = string
  description = "Integer maximum value"
  default     = 1
  validation {
    condition     = var.max < 9 && var.max > 0
    error_message = "Maximum value must be between 1 and 8"
  }
}