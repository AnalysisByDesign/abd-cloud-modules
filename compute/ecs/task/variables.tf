# --------------------------------------------------------------------------------------------
# ECS Task Variables
# --------------------------------------------------------------------------------------------

variable "family" {
  description = "A unique name for your task definition."
  type        = string
}

variable "container_definitions" {
  description = "A list of valid container definitions provided as a single valid JSON document."
  type        = string
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "role_arn" {
  description = "One role used as both the execution role and the task role. Prefer execution_role_arn and task_role_arn"
  type        = string
  default     = ""
}

variable "execution_role_arn" {
  description = "Role ECS uses to start the task: pull images, write logs, read secrets. Falls back to role_arn"
  type        = string
  default     = null
}

variable "task_role_arn" {
  description = "Role the running containers use to call AWS. Falls back to role_arn"
  type        = string
  default     = null
}

variable "requires_compatibilities" {
  description = "The launch type required by the task: EC2 or FARGATE"
  type        = string
  default     = ""
}

variable "network_mode" {
  description = "The Docker networking mode - none, bridge, awsvpc or host."
  type        = string
  default     = ""
}

variable "cpu" {
  description = "CPU units for the whole task. null leaves it to the container definitions (EC2 only)"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory (MiB) for the whole task. null leaves it to the container definitions (EC2 only)"
  type        = string
  default     = "512"
}

variable "cpu_architecture" {
  description = "ARM64 or X86_64. Sets the runtime platform, so the task only places on hosts of that architecture; null leaves it out"
  type        = string
  default     = null

  validation {
    condition     = var.cpu_architecture == null || contains(["ARM64", "X86_64"], coalesce(var.cpu_architecture, "ARM64"))
    error_message = "cpu_architecture must be ARM64, X86_64 or null."
  }
}

variable "volumes" {
  description = "Task volumes. For EFS, give the file system and an access point (IAM authorisation on by default) or a root directory; transit encryption is always on"
  type = list(object({
    name      = string
    host_path = optional(string)
    efs = optional(object({
      file_system_id  = string
      access_point_id = optional(string)
      root_directory  = optional(string, "/")
      iam             = optional(string, "ENABLED")
    }))
  }))
  default = []
}

variable "skip_destroy" {
  description = "Keep old revisions registered when Terraform replaces the task definition"
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "task_tags" {
  description = "Additional tags for the task definition"
  type        = map(string)
  default     = {}
}
