# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# AutoScaling Group
output "id" {
  description = "The ID of the AutoScaling Group"
  value       = "${aws_autoscaling_group.asg.id}"
}

output "arn" {
  description = "The arn of the AutoScaling Group"
  value       = "${aws_autoscaling_group.asg.arn}"
}

output "name" {
  description = "The name of the AutoScaling Group"
  value       = "${aws_autoscaling_group.asg.name}"
}
