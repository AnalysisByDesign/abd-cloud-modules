# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "roles" {
  description = "A list of role details"
  type        = list(string)
  default     = []
}

/*
  # For example...
  roles = [
    {
      name               = "admins"
      description        = "IAM Role to assume"
      assume_role_policy = # JSON policy document
      policy_arn         = "arn:aws:iam::aws:policy/AdministratorAccess"
      policy_name        = ""
    },
  ]
*/

# Optional -----------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to build the roles"
  default     = 1
}

variable "path" {
  description = "Path location for role to be created"
  type        = string
  default     = "/"
}
