# -----------------------------------------------------------------------------
# Launch configuration
# -----------------------------------------------------------------------------

resource "aws_dynamodb_table" "this" {
  name           = "${var.name}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = "${merge(var.common_tags, 
                    var.dynamodb_tags, 
                    map("Name", format("%s", var.name)))}"
}
