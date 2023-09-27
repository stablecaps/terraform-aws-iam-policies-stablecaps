locals {
  custom_policies = {
    "${var.app_name}-basic-cloudwatch-policy" = {
      Version = "2012-10-17"
      Statement = [
        {
          "Sid" : "VisualEditor0",
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogStream",
            "logs:CreateLogGroup",
          ],
          "Resource" : [
            "arn:aws:logs:eu-west-1:779934699932:log-group:/aws/lambda/${var.app_name}-${var.env}",
            "arn:aws:logs:eu-west-1:779934699932:log-group:/aws/lambda/${var.app_name}-${var.env}*:*",
          ]
        },
        {
          "Sid" : "VisualEditor1",
          "Effect" : "Allow",
          "Action" : [
            "logs:PutLogEvents"
          ],
          "Resource" : [
            "arn:aws:logs:eu-west-1:779934699932:log-group:/aws/lambda/${var.app_name}-${var.env}:log-stream:*",
            "arn:aws:logs:eu-west-1:779934699932:log-group:/aws/lambda/${var.app_name}-${var.env}*:*:*"
          ]
        }
      ]
    }
  }

  managed_policies = {
    CloudWatchLogsReadOnlyAccess = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
  }
}


