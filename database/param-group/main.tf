# -----------------------------------------------------------------------------
# db-parameter-group.tf
# -----------------------------------------------------------------------------

resource "aws_db_parameter_group" "this" {
  count = "${var.count}"

  name        = "${var.name}"
  family      = "${var.db_family}"
  description = "Terraform - ${var.description}"

  parameter {
    name  = "log_bin_trust_function_creators"
    value = "${var.log_bin_trust_function_creators}"
  }

  parameter {
    name  = "log_error_verbosity"
    value = "${var.log_error_verbosity}"
  }

  parameter {
    name  = "log_warnings"
    value = "${var.log_warnings}"
  }

  parameter {
    name  = "max_connections"
    value = "${var.max_connections}"
  }

  parameter {
    name  = "max_allowed_packet"
    value = "${var.max_allowed_packet}"
  }

  parameter {
    name  = "query_cache_type"
    value = "${var.query_cache_type}"
  }

  parameter {
    name  = "query_cache_size"
    value = "${var.query_cache_size}"
  }

  parameter {
    name  = "query_cache_limit"
    value = "${var.query_cache_limit}"
  }

  parameter {
    name  = "query_cache_min_res_unit"
    value = "${var.query_cache_min_res_unit}"
  }

  parameter {
    name  = "slow_query_log"
    value = "${var.slow_query_log}"
  }

  parameter {
    name  = "long_query_time"
    value = "${var.long_query_time}"
  }

  parameter {
    name  = "group_concat_max_len"
    value = "${var.group_concat_max_len}"
  }

  parameter {
    name  = "wait_timeout"
    value = "${var.wait_timeout}"
  }

  parameter {
    name  = "sql_mode"
    value = "${var.sql_mode}"
  }

  tags = "${merge(var.common_tags, 
                    var.param_group_tags, 
                    map("Name", var.name))}"
}
