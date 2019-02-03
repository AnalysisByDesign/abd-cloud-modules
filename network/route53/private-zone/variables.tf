# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "search_domain" {
  description = "The domain name of the Route53 Zone"
  type        = "string"
  default     = ""
}

variable "search_domains" {
  description = "A list of search domains to create a public zones for"
  type        = "list"
  default     = []
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "use_existing_zones" {
  description = "Re-use existing public and private zones"
  default     = false
}

variable "r53_tags" {
  description = "Additional tags for the Route53 zone"
  type        = "map"
  default     = {}
}
