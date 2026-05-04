# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "acct_target" {
  description = "Target AWS account to build infrastructure into"
  type        = string
}

variable "domain_name" {
  description = "Domain name for ACM cert"
  type        = string
}

variable "r53_zone_id" {
  description = "Zone id for r53 public zone"
  type        = string
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# Optional -----------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to create an SSL cert"
  default     = false
}

variable "acct_target_role" {
  description = "Role in target account to assume when building infrastructure"
  type        = string
  default     = ""
}

variable "subject_alternative_names" {
  description = ""
  type        = list(string)
  default     = []
}

variable "acm_tags" {
  description = "Additional tags for CloudFront"
  type        = map(string)

  default = {
    "Component" = "acm"
  }
}

# Necessary change to provider.tf becauce of hardcoded region wich is not valid for api
variable "certificate_region" {
  description = "Region in which we want to create our certificate."
  default     = "us-east-1"
}
