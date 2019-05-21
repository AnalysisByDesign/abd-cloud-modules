################################################################
#
# CORE:
# TASK: VARIABLES.TF TASK .
# Provides an ECS task definition to be used in aws_ecs_service.
#
################################################################
variable "requires_compatibilities" {
  default     = ""
  description = "A set of launch types required by the task. The valid values are EC2 and FARGATE"
  type        = "string"
}

variable "family" {
  description = "A unique name for your task definition."
  default     = ""
  type        = "string"
}

variable "role_arn" {
  description = "Role ECS ARN"
  type        = "string"
  default     = ""
}

variable "container_definitions" {
  default     = ""
  description = ""
}

variable "source_volume" {
  default     = ""
  description = "The path on the host container instance that is presented to the container."
  type        = "string"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "network_mode" {
  default     = "awsvpc"
  description = "The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host. "
  type        = "string"
}

variable "cpu" {
  default     = "256"
  type        = "string"
  description = "The number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required. "
}

variable "memory" {
  default     = "512"
  description = "The amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = "string"
}
