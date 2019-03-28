# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "vpc_id" {
  description = "The VPC id to attach the private zone to"
  type        = "string"
}

variable "zone_id" {
  description = "The Route53 zone id to associate the VPC with"
  type        = "string"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------


# None

