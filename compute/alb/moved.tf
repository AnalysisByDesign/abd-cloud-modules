# Moved blocks for aws_alb* -> aws_lb* resource type renames (commit a75d8ad).
# These address in-state churn for stacks whose state was written before the rename.
# Remove this file once all consuming stacks have been re-applied successfully.

moved {
  from = aws_alb.this
  to   = aws_lb.this
}

moved {
  from = aws_alb_listener.actual
  to   = aws_lb_listener.actual
}

moved {
  from = aws_alb_target_group.this
  to   = aws_lb_target_group.this
}
