# Required -----------------------------------------------------------------------------------

variable "repository_name" {
  description = "Name of docker repository"
  type        = string
}

# Optional -----------------------------------------------------------------------------------

variable "required" {
  description = "Do we need to build repository"
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
