# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

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

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "ec2_instance_type" {
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

variable "user_data_script" {
  description = "User data script to inject into the launch template"
  type        = string
  default     = ""
}

variable "disable_api_termination" {
  description = "Disable API termination of instance"
  default     = false
}
