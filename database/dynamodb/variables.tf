# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the DynamoDB table"
  type        = "string"
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "dynamodb_tags" {
  description = "Additional tags for the DynamoDB table"
  type        = "map"

  default = {
    "Component" = "dynamodb"
  }
}
