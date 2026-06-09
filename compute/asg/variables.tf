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

variable "launch_template_version" {
  description = "Launch template version to use"
  type        = string
  default     = "$Latest"
}

variable "subnet_ids" {
  description = "The VPC subnet ids to deploy instances into"
  type        = list(string)
}

variable "tag_map" {
  description = "A list of tag maps to add to all resources"
  type        = list(any)
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

variable "enable_instance_refresh" {
  description = "Automatically trigger a rolling instance refresh when the launch template changes"
  type        = bool
  default     = false
}

variable "instance_refresh_min_healthy_percentage" {
  description = "Minimum percentage of instances that must remain healthy during an instance refresh"
  type        = number
  default     = 100
}

variable "instance_refresh_max_healthy_percentage" {
  description = "Maximum percentage of instances that must remain healthy during an instance refresh"
  type        = number
  default     = 110
}

variable "instance_refresh_instance_warmup" {
  description = "Seconds to wait after a new instance comes in service before moving on during an instance refresh"
  type        = number
  default     = null
}

variable "instance_refresh_triggers" {
  description = "List of property name changes to trigger a refresh"
  type        = list(string)
  default     = []
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
