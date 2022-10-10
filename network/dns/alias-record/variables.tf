# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "zone_id" {
  description = "The name of the Route53 zone to build the record in"
  type        = string
}

variable "name" {
  description = "The name of the Route53 record"
  type        = string
}

variable "alias_name" {
  description = "Alias target domain name"
  type        = string
}

variable "alias_zone_id" {
  description = "Alias target domain name zone id"
  type        = string
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "alias_evaluate_target_health" {
  description = "Evaluate target domain name health"
  default     = false
}
