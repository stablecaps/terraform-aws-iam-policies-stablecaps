<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.9.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_basic_role_example"></a> [basic\_role\_example](#module\_basic\_role\_example) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Aplication name | `string` | `"tfmod-rolepol-gen-eg1"` | no |
| <a name="input_env"></a> [env](#input\_env) | Deployment environment. e.g. dev, uat, prod | `string` | `"live-test"` | no |
| <a name="input_trusted_entity_principals"></a> [trusted\_entity\_principals](#input\_trusted\_entity\_principals) | IAM Trusted entity principals | `map(string)` | <pre>{<br>  "Service": "ec2.amazonaws.com"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | IAM role arn |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | IAM role ID |
<!-- END_TF_DOCS -->