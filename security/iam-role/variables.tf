# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "roles" {
  description = "A map of IAM role configurations, keyed by role name"
  type = map(object({
    description          = string
    assume_role_policy   = string
    policy_arn           = string
    max_session_duration = optional(number, 3600)
  }))
  default = {}
}

/*
  # For example...
  roles = {
    admins = {
      description          = "IAM Role to assume"
      assume_role_policy   = # JSON policy document
      policy_arn           = "arn:aws:iam::aws:policy/AdministratorAccess"
      max_session_duration = 3600
    }
  }
*/

# Optional -----------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to build the roles"
  type        = bool
  default     = true
}

variable "path" {
  description = "Path location for role to be created"
  type        = string
  default     = "/"
}
