# --------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------

# Delegation Set
output "id" {
  description = "The ID of the delegate set"
  value       = join("", aws_route53_delegation_set.delegate.*.id)
}

output "name_servers" {
  description = "The Name Servers of the delegate set"
  value       = aws_route53_delegation_set.delegate.*.name_servers
}
