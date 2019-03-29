# --------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------

variable "name" {
  description = "Name of DB parameter groups"
  type        = "string"
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
}

# Optional -----------------------------------------------------------------------------------
variable "count" {
  description = "Count of number of resources required"
  default     = 1
}

variable "description" {
  description = "The RDS parameter groups description"
  type        = "string"
  default     = "Terraform managed"
}

variable "db_family" {
  description = "The Aurora family for the param group"
  type        = "string"
  default     = "aurora-mysql5.7"
}

variable "log_bin_trust_function_creators" {
  description = "Allow creation of stored procedures"
  default     = 1
}

variable "log_error_verbosity" {
  description = "What level of warnings to log to the error file (default error and warning)"
  default     = 2
}

variable "log_warnings" {
  description = "What level of warnings to log to the error file (default error and warning)"
  default     = 2
}

variable "max_connections" {
  description = "Max inbound connections allowed"
  default     = 1500
}

variable "max_allowed_packet" {
  description = "Max allowed input data packet (default 1 Gb)"
  default     = 1073741824
}

variable "query_cache_type" {
  description = "Enable or disable the query cache (Recommended ON for Aurora)"
  default     = 1
}

variable "query_cache_size" {
  description = "Size of query cache in bytes (default 8 Mb)"
  default     = 8388608
}

variable "query_cache_limit" {
  description = "Do not cache results larger than ... (default 1 Mb)"
  default     = 1048576
}

variable "query_cache_min_res_unit" {
  description = "Do not cache results smaller than ... (default 4 Kb)"
  default     = 4096
}

variable "slow_query_log" {
  description = "Enable the slow query log"
  default     = 1
}

variable "long_query_time" {
  description = "Long query time in seconds"
  default     = 2
}

variable "group_concat_max_len" {
  description = "Group concat max string length (default 4 Gb)"
  default     = 4294967295
}

variable "wait_timeout" {
  description = "The number of seconds the server waits for activity on a non-interactive connection"
  default     = 600
}

variable "sql_mode" {
  description = "Current SQL Server Mode."
  type        = "string"
  default     = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
}

variable "param_group_tags" {
  description = "A map of tags to add to parameter group"
  type        = "map"

  default = {
    "Component" = "rds aurora"
  }
}
