# -----------------------------------------------------------------------------
# db-parameter-group.tf
# -----------------------------------------------------------------------------

resource "aws_rds_cluster_parameter_group" "this" {
  count = "${var.count}"

  name        = "${var.name}"
  family      = "${var.db_family}"
  description = "Terraform - ${var.description}"

  parameter {
    name  = "collation_server"
    value = "${var.collation}"
  }

  parameter {
    name  = "collation_connection"
    value = "${var.collation}"
  }

  parameter {
    name  = "character_set_client"
    value = "${var.character_set}"
  }

  parameter {
    name  = "character_set_server"
    value = "${var.character_set}"
  }

  parameter {
    name  = "character_set_results"
    value = "${var.character_set}"
  }

  parameter {
    name  = "character_set_database"
    value = "${var.character_set}"
  }

  parameter {
    name  = "character_set_connection"
    value = "${var.character_set}"
  }

  parameter {
    name  = "character_set_filesystem"
    value = "${var.character_set}"
  }

  # We are forcing all systems to use UTC for date/time storage
  parameter {
    name  = "time_zone"
    value = "UTC"
  }

  tags = "${merge(var.common_tags, 
                    var.param_group_tags, 
                    map("Name", var.name))}"
}
