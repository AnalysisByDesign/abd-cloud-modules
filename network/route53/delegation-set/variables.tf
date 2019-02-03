# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# None

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "use_existing_zones" {
  description = "Re-use existing public and private zones"
  default     = false
}

variable "delegate_set_name" {
  description = "A reference name for the delegation set"
  type        = "string"
  default     = ""
}
