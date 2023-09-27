<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_policies"></a> [custom\_policies](#input\_custom\_policies) | Map of maps containing IAM policy definitions. Map key is used as policy name | `any` | `{}` | no |
| <a name="input_managed_policies"></a> [managed\_policies](#input\_managed\_policies) | Map of maps containing predinied IAM managed policy arns. | `map(string)` | `{}` | no |
| <a name="input_role_desc"></a> [role\_desc](#input\_role\_desc) | AWS IAM role description. String must contain $env | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | AWS IAM role name. String must contain $env | `string` | n/a | yes |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | AWS IAM role path location. String must begin with '/(live-test\|lambda\|ec2)*' | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(string)` | n/a | yes |
| <a name="input_trusted_entity_principals"></a> [trusted\_entity\_principals](#input\_trusted\_entity\_principals) | IAM Trusted entity principals | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | IAM role arn |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | IAM role ID |
<!-- END_TF_DOCS -->