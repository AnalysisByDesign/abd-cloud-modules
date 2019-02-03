# Required -----------------------------------------------------------------------------------

variable "repository_name" {
  description = "Name of ECR repositry"
  type        = "string"
}

# Optional -----------------------------------------------------------------------------------

variable "repository_policy_document" {
  description = "Policies for ECR registry"
  type        = "string"
  default     = ""
}

variable "ecr_lifecycle_document" {
  description = "Lifecycle policies for ECR"
  type        = "string"
  default     = ""
}

variable "ecr_repository_enabled" {
  description = "Do we need to build repository"
  default     = false
}
