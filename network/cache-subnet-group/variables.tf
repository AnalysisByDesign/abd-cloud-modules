# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

# Cache Subnet Group Name
variable "name" {
  description = "Name of Cache subnet group table"
  type        = string
}

variable "subnet_ids" {
  description = "The VPC subnet ids to group together"
  type        = list(string)
}

# Optional -----------------------------------------------------------------------------------
variable "required" {
  description = "Do we need to create this subnet group"
  type        = bool
  default     = true
}

variable "description" {
  description = "The IAM policy description"
  type        = string
  default     = "Terraform managed"
}
