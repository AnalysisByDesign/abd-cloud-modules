# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "search_domain" {
  description = "The search domain to create a public zone for"
  type        = string
  default     = ""
}

variable "search_domains" {
  description = "A list of search domains to create a public zones for"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "delegation_set_id" {
  description = "The delegation set id to build the public zone for"
  type        = string
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
  type        = map(string)
  default     = {}
}
