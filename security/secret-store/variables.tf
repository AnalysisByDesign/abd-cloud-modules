# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "key" {
  description = "Key to store the secret value under"
  type        = "string"
}

# Optional -----------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to store this secret"
  default     = true
}

variable "description" {
  description = "A description for the value to be stored"
  type        = "string"
  default     = ""
}

variable "type" {
  description = "What is the type of value to be stored"
  type        = "string"
  default     = "string"
}

variable "value" {
  description = "What is the value to be stored"
  type        = "string"
  default     = ""
}

variable "tags" {
  description = "Tags for the secret parameter"
  type        = "map"
  default     = {}
}
