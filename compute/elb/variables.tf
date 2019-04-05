# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the load balancer"
  type        = "string"
}

variable "subnet_ids" {
  description = "The VPC subnet ids to deploy instances into"
  type        = "list"
}

variable "security_group_ids" {
  description = "A list of security group ids for the auto-scaling instance"
  type        = "list"
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "lb_port" {
  description = "Inbound load balancer port number"
  type        = "string"
  default     = "80"
}

variable "lb_protocol" {
  description = "Inbound load balancer protocol"
  type        = "string"
  default     = "TCP"
}

variable "instance_port" {
  description = "Outbound load balancer port number to instance"
  type        = "string"
  default     = "80"
}

variable "instance_protocol" {
  description = "Outbound load balancer protocol to instance"
  type        = "string"
  default     = "TCP"
}

variable "healthcheck_healthy_threshold" {
  description = "Healthcheck healthy threshold"
  type        = "string"
  default     = "2"
}

variable "healthcheck_unhealthy_threshold" {
  description = "Healthcheck unhealthy threshold"
  type        = "string"
  default     = "2"
}

variable "healthcheck_timeout" {
  description = "Healthcheck timeout"
  type        = "string"
  default     = "3"
}

variable "healthcheck_interval" {
  description = "Healthcheck interval"
  type        = "string"
  default     = "30"
}

variable "healthcheck_target" {
  description = "Healthcheck target - defaults to instance_protocol:instance_port"
  type        = "string"
  default     = ""
}

variable "cross_zone_load_balancing" {
  description = "Enable cross zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "Idle timeout"
  type        = "string"
  default     = "60"
}

variable "connection_draining" {
  description = "Enable connection draining"
  default     = true
}

variable "connection_draining_timeout" {
  description = "Connection draining timeout"
  type        = "string"
  default     = "300"
}

variable "elb_tags" {
  description = "Additional tags for the LB"
  type        = "map"
  default     = {}
}
