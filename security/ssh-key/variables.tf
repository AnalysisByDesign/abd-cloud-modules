# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------
# Required -----------------------------------------------------------------------------------
# Optional -----------------------------------------------------------------------------------

variable "name" {
  description = "Name of SSH key to upload"
  type        = string
}

variable "public_key_file" {
  description = "Physical file location of public key part to upload"
  type        = string
}
