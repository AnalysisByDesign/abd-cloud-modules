# -----------------------------------------------------------------------------
# db-subnet-group.tf
# -----------------------------------------------------------------------------
resource "aws_db_subnet_group" "this" {
  count = "${var.count}"

  name        = "${var.name}"
  subnet_ids  = ["${var.subnet_ids}"]
  description = "Terraform - ${var.description}"

  tags = "${merge(var.common_tags, 
                    var.subnet_tags, 
                    map("Name", var.name))}"
}
