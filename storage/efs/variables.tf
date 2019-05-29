# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the EFS volume"
}

variable "kms_key_id" {
  description = "Create an encrypted data volume"
  type        = "string"
}

variable "subnet_ids" {
  description = "A list of subnet ids inside the VPC"
  type        = "list"
}

variable "security_group_ids" {
  description = "A list of security group ids for the EFS volume"
  type        = "list"
}

variable "route53_zone_id" {
  description = "The Route53 zone id to put the R53 records in"
  type        = "string"
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "route53_name" {
  description = "Friendly name for route53 entry"
  type        = "string"
  default     = ""
}

variable "performance_mode" {
  description = "The performance mode of the EFS filesystem"
  type        = "string"
  default     = "generalPurpose"
}

variable "encrypted" {
  description = "Create an encrypted data volume"
  default     = true
}

variable "efs_tags" {
  description = "Additional tags for the EFS volume"
  type        = "map"
  default     = {}
}
