### Loop & attach custom policies
resource "aws_iam_role_policy" "this" {

  for_each = length(var.custom_policies) > 0 ? var.custom_policies : {}

  name_prefix = each.key

  role = aws_iam_role.this.id

  policy = jsonencode(each.value)

  lifecycle {
    create_before_destroy = true
  }
}


### Loop & attach AWS managed policies
resource "aws_iam_role_policy_attachment" "this" {

  count = length(var.managed_policies)

  role       = aws_iam_role.this.name
  policy_arn = var.managed_policies[count.index]
}
