# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name prefix of the EC2 instances"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances, or resolve:ssm:<parameter> to resolve an SSM parameter at each launch"
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
  description = "Do the EC2 resources need a public IP (auto-assigned on the primary network interface)"
  type        = bool
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

variable "cpu_credits" {
  description = "CPU credit option for burstable instance types (standard or unlimited). null leaves the credit specification out"
  type        = string
  default     = "unlimited"

  validation {
    condition     = var.cpu_credits == null || contains(["standard", "unlimited"], coalesce(var.cpu_credits, "standard"))
    error_message = "cpu_credits must be standard, unlimited or null."
  }
}

variable "metadata_http_tokens" {
  description = "IMDS token setting (required or optional). null, with a null hop limit, leaves metadata options at the AMI's defaults"
  type        = string
  default     = null

  validation {
    condition     = var.metadata_http_tokens == null || contains(["required", "optional"], coalesce(var.metadata_http_tokens, "required"))
    error_message = "metadata_http_tokens must be required, optional or null."
  }
}

variable "metadata_http_put_response_hop_limit" {
  description = "IMDS PUT response hop limit (1 to 64). 1 blocks containers on a bridge network from the instance metadata"
  type        = number
  default     = null
}
