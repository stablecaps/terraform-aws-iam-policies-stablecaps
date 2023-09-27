resource "aws_iam_role" "this" {
  name_prefix = var.role_name

  description = var.role_desc

  path = var.role_path

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = "tfmod1"
        Principal = var.trusted_entity_principals
      },
    ]
  })

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}
