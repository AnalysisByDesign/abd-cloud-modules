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
variable "count" {
  description = "Count of number of resources required"
  default     = 1
}

variable "description" {
  description = "The IAM policy description"
  type        = string
  default     = "Terraform managed"
}

variable "elasticache_family" {
  default = "redis4.0"
}

variable "activerehashing" {
  default = "yes"
}
