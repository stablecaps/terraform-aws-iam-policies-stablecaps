output "iam_role_arn" {
  description = "IAM role arn"
  value       = aws_iam_role.this.arn
}

output "iam_role_id" {
  description = "IAM role ID"
  value       = aws_iam_role.this.id
}