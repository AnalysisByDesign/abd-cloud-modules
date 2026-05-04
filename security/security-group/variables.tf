# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "name" {
  description = "The security group name"
  type        = string
}

variable "vpc_id" {
  description = "The VPC id to build the security group in"
  type        = string
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# Optional -----------------------------------------------------------------------------------

variable "sg_tags" {
  description = "Additional tags for the security group"
  type        = map(string)
  default     = {}
}

variable "description" {
  description = "The description for the security group"
  type        = string
  default     = ""
}

variable "revoke_rules_on_delete" {
  description = "Should we force delete all rules before deleting the SG"
  default     = false
}

variable "timeouts" {
  description = "Configurable timeouts for the resource"
  type        = map(string)
  default     = {}
}
