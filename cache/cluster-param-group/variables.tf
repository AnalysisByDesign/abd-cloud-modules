# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------
variable "name" {
  description = "Name of Elasticache cluster parameter groups"
  type        = string
}

# Optional -----------------------------------------------------------------------------------

variable "description" {
  description = "The IAM policy description"
  type        = string
  default     = "Terraform managed"
}

variable "elasticache_family" {
  description = "The ElastiCache parameter group family"
  type        = string
  default     = "redis7.x"
}

variable "activerehashing" {
  default = "yes"
}
