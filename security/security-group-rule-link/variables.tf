# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "security_group_id" {
  description = "The security group id to attach this rule to"
  type        = "string"
}

variable "type" {
  description = "The security group type - egress or ingress"
  type        = "string"
}

variable "protocol" {
  description = "The security group protocol"
  type        = "string"
}

variable "source_security_group_id" {
  description = "The source security group to allow ingress/egress from/to"
  type        = "string"
}

# Optional -----------------------------------------------------------------------------------

variable "single_port" {
  description = "The security group single port"
  type        = "string"
  default     = ""
}

variable "from_port" {
  description = "The security group port range start"
  type        = "string"
  default     = ""
}

variable "to_port" {
  description = "The security group port range end"
  type        = "string"
  default     = ""
}

variable "description" {
  description = "The description for the security group"
  type        = "string"
  default     = ""
}

variable "timeouts" {
  description = "Configurable timeouts for the resource"
  type        = "map"
  default     = {}
}
