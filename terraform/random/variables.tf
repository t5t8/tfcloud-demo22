variable "min" {
  type        = string
  description = "Integer minimum value"
  default     = 1
  validation {
    condition     = length(var.min) =< 8 && length(var.min) => 1 
    error_message = "Maximum value must be between 1 and 8"
  }
}

variable "max" {
  type        = string
  description = "Integer maximum value"
  default     = 1
  validation {
    condition     = length(var.max) =< 8 && length(var.max) => 1
    error_message = "Maximum value must be between 1 and 8"
  }
}