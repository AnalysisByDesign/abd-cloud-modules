# --------------------------------------------------------------------------------------------
# CloudWatch Log Groups
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------
variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

variable "cloudwatch_tags" {
  description = "Additional tags for CloudWatch"
  type        = "map"
}

variable "cloudwatch_loggroup_names" {
  description = "Group name for cloudwatch"
  type        = "list"
}
