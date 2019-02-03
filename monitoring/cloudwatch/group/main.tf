# -----------------------------------------------------------------------------
# CloudWatch Log Groups
# -----------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "log_group" {
  count = "${length(var.cloudwatch_loggroup_names)}"
  name  = "${element(var.cloudwatch_loggroup_names, count.index)}"

  tags = "${merge(var.common_tags,
                    var.cloudwatch_tags,
                    map("Name", format("%s", element(var.cloudwatch_loggroup_names, count.index ))))}"
}
