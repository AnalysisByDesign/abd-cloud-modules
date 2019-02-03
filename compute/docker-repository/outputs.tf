output "repository_name" {
  value = "${join("", aws_ecr_repository.this.*.name)}"
}

output "repository_arn" {
  value = "${join("", aws_ecr_repository.this.*.arn)}"
}

output "repository_url" {
  value = "${join("", aws_ecr_repository.this.*.repository_url)}"
}

output "registry_id" {
  value = "${join("", aws_ecr_repository.this.*.registry_id)}"
}
