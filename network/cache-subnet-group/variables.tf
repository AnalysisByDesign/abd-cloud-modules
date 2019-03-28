# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

# Cache Subnet Group Name
variable "name" {
  description = "Name of Cache subnet group table"
  type        = "string"
}

variable "subnet_ids" {
  description = "The VPC subnet ids to group together"
  type        = "list"
}

# Optional -----------------------------------------------------------------------------------
variable "count" {
  description = "Count of number of resources required"
  default     = 1
}

variable "description" {
  description = "The IAM policy description"
  type        = "string"
  default     = "Terraform managed"
}
