# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The VPC id for the target group"
  type        = string
}

variable "subnet_ids" {
  description = "The VPC subnet ids to load balance across"
  type        = list(string)
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "cross_zone_load_balancing" {
  description = "Enable cross zone load balancing"
  default     = true
}

variable "lb_tags" {
  description = "Additional tags for the NLB"
  type        = map(string)
  default     = {}
}

variable "ingress_port" {
  description = "The ingress port for the LB to listen on"
  type        = string
  default     = "22"
}

variable "instance_port" {
  description = "The instance port for the LB to connect to"
  type        = string
  default     = "22"
}

variable "slow_start" {
  description = "Slow start timeout before sending requests to the host"
  type        = string
  default     = "30"
}

variable "target_type" {
  description = "LB target instance type"
  type        = string
  default     = "instance"
}

variable "healthcheck_interval" {
  description = "Healthcheck interval"
  type        = string
  default     = "30"
}

variable "healthcheck_healthy_threshold" {
  description = "Healthcheck healthy threshold"
  type        = string
  default     = "2"
}

variable "healthcheck_unhealthy_threshold" {
  description = "Healthcheck unhealthy threshold"
  type        = string
  default     = "2"
}

variable "protocol" {
  default     = "TCP"
  type        = string
  description = "Should be one of TCP, HTTP, HTTPS or TLS."
}
