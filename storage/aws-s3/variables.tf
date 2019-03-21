# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the S3 bucket"
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "count" {
  description = "Do we need to create the bucket"
  type        = "string"
  default     = "1"
}

variable "region" {
  description = "A different region to build the bucket in"
  type        = "string"
  default     = ""
}

variable "acl" {
  description = "The canned ACL to apply"
  type        = "string"
  default     = "private"
}

variable "bucket_policy" {
  description = "S3 bucket policy"
  type        = "string"
  default     = ""
}

variable "logging" {
  description = "Logging definition for the bucket"
  type        = "list"
  default     = []
}

variable "lifecycle_rule" {
  description = "Lifecycle rules for the bucket"
  type        = "list"
  default     = []
}

variable "force_destroy" {
  description = "Forcibly destroy all objects if removing the bucket - be careful!"
  default     = false
}

variable "acceleration_status" {
  description = "Acceleration status of the bucket"
  default     = "Suspended"
}

variable "replication_configuration" {
  description = "Replication configuration details"
  type        = "list"
  default     = []
}

variable "enable_versioning" {
  description = "Enable object versioning"
  default     = false
}

variable "enable_mfa_delete" {
  description = "Require an MFA device to delete objects"
  default     = false
}

variable "s3_tags" {
  description = "Additional tags for the S3 bucket"
  type        = "map"
  default     = {}
}
