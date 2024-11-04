# Hello Custom!
This example demoinstrates how to run the module using custom input values and shows what output is to be expected.

## Usage
1. From inside this directory run `terraform init`
2. Then run `terraform apply`
3. When prompted for the `name` value, enter your name.

<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms_key"></a> [kms\_key](#module\_kms\_key) | terraform-aws-modules/kms/aws | 3.0.0 |
| <a name="module_wizardai_aws_s3_bucket"></a> [wizardai\_aws\_s3\_bucket](#module\_wizardai\_aws\_s3\_bucket) | ../../modules/wizardai_aws_s3_bucket | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | environment | `string` | `"development"` | no |
| <a name="input_name"></a> [name](#input\_name) | Enter your name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_bucket_domain_name"></a> [s3\_bucket\_bucket\_domain\_name](#output\_s3\_bucket\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The name of the bucket. |
<!-- END_TF_DOCS -->