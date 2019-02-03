output "ecr_arn" {
  value = "${join("", aws_ecr_repository.this.*.arn)}"
}

output "ecr_url" {
  value = "${join("", aws_ecr_repository.this.*.repository_url)}"
}

output "ecr_registry_id" {
  value = "${join("", aws_ecr_repository.this.*.registry_id)}"
}

output "registry_name" {
  value = "${join("", aws_ecr_repository.this.*.name)}"
}
