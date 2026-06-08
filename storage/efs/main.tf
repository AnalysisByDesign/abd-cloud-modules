# -----------------------------------------------------------------------------
# efs.tf
# -----------------------------------------------------------------------------

resource "aws_efs_file_system" "this" {
  creation_token = var.name
  encrypted      = var.encrypted
  kms_key_id     = var.kms_key_id

  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy_transition_to_ia != null ? [1] : []
    content {
      transition_to_ia = var.lifecycle_policy_transition_to_ia
    }
  }

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy_transition_to_archive != null ? [1] : []
    content {
      transition_to_archive = var.lifecycle_policy_transition_to_archive
    }
  }

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy_transition_to_primary_storage_class != null ? [1] : []
    content {
      transition_to_primary_storage_class = var.lifecycle_policy_transition_to_primary_storage_class
    }
  }

  tags = merge(var.common_tags, var.efs_tags, { Name = var.name })
}
