# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "name" {
  description = "The IAM policy name"
  type        = string
}

# Optional -----------------------------------------------------------------------------------

variable "create_me" {
  description = "Should we create the policy"
  default     = 1
}

variable "path" {
  description = "Path location for policy to be created"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The IAM policy description"
  type        = string
  default     = "Terraform managed"
}

variable "policy" {
  description = "The IAM policy to apply"
  type        = string
  default     = ""
}
