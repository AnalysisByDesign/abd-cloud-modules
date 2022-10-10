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

variable "type" {
  description = "The type of the Route53 record"
  type        = string
  default     = "A"
}

variable "records" {
  description = "DNS records to add to route53 record"
  type        = list(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to create this - can be disabled from within another module"
  type        = string
  default     = 1
}

variable "ttl" {
  description = "The TTL for the Route53 record"
  type        = string
  default     = "60"
}
