# Required -----------------------------------------------------------------------------------

variable "repository_name" {
  description = "Name of docker repository"
  type        = string
}

# Optional -----------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to build repository"
  type        = bool
  default     = false
}

variable "repository_policy_document" {
  description = "Policies for ECR repository"
  type        = string
  default     = ""
}

variable "repository_lifecycle_document" {
  description = "Lifecycle policies for ECR"
  type        = string
  default     = ""
}

variable "image_tag_mutability" {
  description = "Tag mutability: MUTABLE, IMMUTABLE, MUTABLE_WITH_EXCLUSION or IMMUTABLE_WITH_EXCLUSION"
  type        = string
  default     = "MUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE", "MUTABLE_WITH_EXCLUSION", "IMMUTABLE_WITH_EXCLUSION"], var.image_tag_mutability)
    error_message = "image_tag_mutability must be MUTABLE, IMMUTABLE, MUTABLE_WITH_EXCLUSION or IMMUTABLE_WITH_EXCLUSION."
  }
}

variable "image_tag_mutability_exclusion_filters" {
  description = "Wildcard tag filters that take the opposite mutability (only with the *_WITH_EXCLUSION settings)"
  type        = list(string)
  default     = []
}

variable "scan_on_push" {
  description = "Run a basic vulnerability scan when an image is pushed"
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "Encryption at rest: AES256 (free) or KMS (set kms_key_arn, or leave empty for the AWS managed key)"
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "KMS"], var.encryption_type)
    error_message = "encryption_type must be AES256 or KMS."
  }
}

variable "kms_key_arn" {
  description = "KMS key ARN when encryption_type is KMS (empty for the AWS managed key)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the repository"
  type        = map(string)
  default     = {}
}
