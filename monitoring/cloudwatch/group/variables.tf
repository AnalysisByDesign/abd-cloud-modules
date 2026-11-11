# --------------------------------------------------------------------------------------------
# CloudWatch Log Groups
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------
variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "cloudwatch_tags" {
  description = "Additional tags for CloudWatch"
  type        = map(string)
}

variable "cloudwatch_loggroup_names" {
  description = "Group name for cloudwatch"
  type        = list(string)
}

# Optional -----------------------------------------------------------------------------------
variable "retention_in_days" {
  description = "Days to keep log events (0 keeps them forever)"
  type        = number
  default     = 7

  validation {
    condition     = contains([0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653], var.retention_in_days)
    error_message = "retention_in_days must be one of the values CloudWatch Logs accepts."
  }
}
