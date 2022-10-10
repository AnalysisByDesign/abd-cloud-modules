# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

# DB Subnet Group Name
variable "name" {
  description = "Name of DB subnet group table"
  type        = string
}

variable "subnet_ids" {
  description = "The VPC subnet ids to group together"
  type        = list(string)
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
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

variable "subnet_tags" {
  description = "A map of subnet tags to add to subnet group"
  type        = map(string)

  default = {
    "Component" = "rds aurora"
  }
}
