# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "name" {
  description = "Name of DB cluster parameter groups"
  type        = "string"
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# Optional -----------------------------------------------------------------------------------
variable "count" {
  description = "Count of number of resources required"
  default     = 1
}

variable "description" {
  description = "The RDS parameter groups description"
  type        = "string"
  default     = "Terraform managed"
}

variable "db_family" {
  description = "The Aurora family for the param group"
  type        = "string"
  default     = "aurora-mysql5.7"
}

variable "character_set" {
  description = "Default character set configuration"
  type        = "string"
  default     = "utf8"
}

variable "collation" {
  description = "Default collation configuration"
  type        = "string"
  default     = "utf8_general_ci"
}

variable "param_group_tags" {
  description = "A map of tags to add to cluster parameter group"
  type        = "map"

  default = {
    "Component" = "rds aurora"
  }
}
