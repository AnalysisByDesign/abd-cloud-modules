# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Singular -----------------------------------------------------------------------------------

variable "name" {
  description = "The IAM policy name"
  type        = "string"
  default     = ""
}

variable "assume_role_policy" {
  description = "The IAM policy to apply to the role"
  type        = "string"
  default     = ""
}

# Multiple -----------------------------------------------------------------------------------

variable "roles" {
  description = "A list of role details"
  type        = "list"
  default     = []
}

/*
  # For example...
  roles = [
    {
      name        = "sre-squad"
      policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
      policy_name = ""
      description = "IAM Role for sre-squad members to assume"
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
  type        = "string"
  default     = "/"
}

variable "description" {
  description = "The IAM policy description"
  type        = "string"
  default     = "Terraform managed"
}

variable "policy" {
  description = "The IAM policy to apply"
  type        = "string"
  default     = ""
}
