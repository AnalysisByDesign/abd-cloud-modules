# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the ALB."
  type        = string
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to attach to the LB."
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the LB."
  type        = list(string)
}

variable "acm_arn" {
  description = "SSL cert ARN to add to listener."
  type        = string
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "alb_tags" {
  description = "Additional tags for the LB"
  type        = map(string)
  default     = {}
}

variable "internal" {
  description = "Is this ALB internal"
  default     = false
}

variable "interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target."
  type        = string
  default     = "60"
}

variable "path" {
  description = "The destination for the health check request."
  type        = string
  default     = "/"
}

variable "timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check."
  type        = string
  default     = "10"
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy."
  type        = string
  default     = "10"
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = string
  default     = "2"
}

variable "success_code" {
  description = "The HTTP codes to use when checking for a successful response from a target."
  type        = string
  default     = "200,301,302"
}

variable "stickiness_enabled" {
  description = "Enable sticky sessions between the load balancer and application instances"
  default     = false
}

variable "target_type" {
  description = "The target type for the group - instance or ip"
  type        = string
  default     = "instance"
}

# ============================================================================================
#                                      WAF
# ============================================================================================
variable "waf_enabled" {
  description = "Is WAF enabled"
  default     = false
}

variable "waf_web_acl" {
  description = "AWS WAF WEB ACL id"
  type        = string
  default     = ""
}
