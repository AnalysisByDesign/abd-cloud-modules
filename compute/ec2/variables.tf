# -----------------------------------------------------------------------------
# Variable definitions
# -----------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "name" {
  description = "The name prefix of the EC2 instances"
  type        = string
}

variable "image_id" {
  description = "The EC2 AMI image id"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group ids for the auto-scaling instance"
  type        = list(string)
}

variable "subnet_ids" {
  description = "The VPC subnet ids to deploy instances into"
  type        = list(string)
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# Optional -----------------------------------------------------------------------------------

variable "count" {
  default = 1
}

variable "instance_type" {
  description = "The EC2 instance type to build"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  description = "SSH key name to apply"
  type        = string
  default     = ""
}

variable "iam_profile_id" {
  description = "IAM instance profile to use for EC2 instances"
  type        = string
  default     = ""
}

variable "require_public_ip" {
  description = "Do the EC2 resources need a public IP"
  default     = false
}

variable "disable_api_termination" {
  description = "Disable API termination of instance"
  default     = false
}

variable "ebs_optimized" {
  description = "Enable EBS optimized"
  default     = true
}
