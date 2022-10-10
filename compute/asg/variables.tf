# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name prefix of the EC2 instances"
  type        = string
}

variable "launch_template_id" {
  description = "Launch template_id to use"
  type        = string
}

variable "subnet_ids" {
  description = "The VPC subnet ids to deploy instances into"
  type        = list(string)
}

variable "tag_map" {
  description = "A list of tag maps to add to all resources"
  type        = list(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "min_size" {
  description = "Minimum size of the autoscaling group"
  type        = string
  default     = "1"
}

variable "desired_capacity" {
  description = "Desired size of the autoscaling group"
  type        = string
  default     = "1"
}

variable "max_size" {
  description = "Maximum size of the autoscaling group"
  type        = string
  default     = "1"
}

variable "default_cooldown" {
  description = "Cooldown period before allowing another autoscaling action"
  type        = string
  default     = "120"
}

variable "health_check_grace_period" {
  description = "Maximum"
  type        = string
  default     = "240"
}

variable "health_check_type" {
  description = "Maximum"
  type        = string
  default     = "ELB"
}

variable "capacity_timeout" {
  description = "Maximum"
  type        = string
  default     = "600s"
}

variable "force_delete" {
  description = "Force delete of autoscaling group if instances not terminating"
  type        = string
  default     = "false"
}

variable "termination_policies" {
  description = "Termination policies to apply to instances"
  type        = list(string)
  default     = ["default"]
}

#variable "load_balancer_ids" {
#  description = "Load balancer ids to attach instances to"
#  type        = "list"
#  default     = []
#}

variable "target_group_arns" {
  description = "Load balancer arns to attach instances to"
  type        = list(string)
  default     = []
}

variable "delete_timeout" {
  description = "Delete timeout setting"
  type        = string
  default     = "15m"
}

variable "enabled_metrics" {
  description = "What metrics to monitor"
  type        = list(string)

  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}
