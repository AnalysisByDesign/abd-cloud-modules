# -----------------------------------------------------------------------------
# CloudWatch Log Groups
# -----------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "log_groups" {
  count = length(var.cloudwatch_loggroup_names)
  name  = element(var.cloudwatch_loggroup_names, count.index)

  retention_in_days = 7

  tags = merge(var.common_tags, var.cloudwatch_tags, { Name = element(var.cloudwatch_loggroup_names, count.index) })
}
