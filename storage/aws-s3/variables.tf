# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# --------------------------------------------------------------------------------------------

variable "create_bucket" {
  description = "Set to false to skip creating the bucket (replaces the old 'count' variable)"
  type        = bool
  default     = true
}

variable "region" {
  description = "Deprecated: bucket region is now controlled by the provider configuration"
  type        = string
  default     = ""
}

variable "acl" {
  description = "Canned ACL to apply. If empty or 'private', BucketOwnerEnforced ownership is used (no ACL). Any other value enables ObjectWriter ownership."
  type        = string
  default     = "private"
}

variable "bucket_policy" {
  description = "S3 bucket policy JSON document"
  type        = string
  default     = ""
}

variable "logging" {
  description = "Access logging configuration. Set to null to disable logging."
  type = object({
    target_bucket = string
    target_prefix = string
  })
  default = null
}

variable "lifecycle_rule" {
  description = "List of lifecycle rule objects. Each object requires: id, enabled. Optional: expiration, noncurrent_version_expiration, transition."
  type        = list(any)
  default     = []
}

variable "force_destroy" {
  description = "Forcibly destroy all objects when removing the bucket"
  type        = bool
  default     = false
}

variable "acceleration_status" {
  description = "Transfer acceleration status. Set to 'Enabled' to enable, or leave empty to leave unconfigured."
  type        = string
  default     = ""
}

variable "replication_configuration" {
  description = "Replication configuration object with 'role' and 'rules' keys. Set to null to disable."
  type        = any
  default     = null
}

variable "enable_versioning" {
  description = "Enable S3 object versioning"
  type        = bool
  default     = false
}

variable "enable_mfa_delete" {
  description = "Require an MFA device to delete versioned objects"
  type        = bool
  default     = false
}

variable "s3_tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}
