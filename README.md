
# Wizard.Ai S3 Bucket Module

## Overview

The **Wizard.Ai S3 Bucket Module** is a Terraform module that provides a streamlined way to create Amazon S3 buckets while enforcing essential organization policies. This module adds configurations for enhanced security and compliance, including:

- **Encryption at Rest**: Ensures all data stored in the S3 bucket is encrypted.
- **HTTPS-Only Access**: Restricts access to the bucket using HTTPS, providing secure data transfer.

## Features

- **Customizable Bucket Name**: Easily set a unique name for your S3 bucket.
- **Environment Tagging**: Specify different environments (e.g., development, staging, production).
- **Tagging Support**: Add key-value pairs to categorize resources for better management.

## Usage

To utilize the Wizard.Ai S3 Bucket Module, include the following code in your Terraform configuration:

```hcl
module "s3_bucket" {
  source = "./modules/wizardai_aws_s3_bucket"

  name        = "example-bucket"
  environment = "development"

  encryption_algorithm = "AES256"

  tags = {
    Environment = var.environment
    Project     = var.name
  }
}
```

## Inputs

| Name        | Description                      | Type     | Default   |
|-------------|-------------------------------------|----------|-----------|
| `name`      | The name of the S3 bucket       | `string` | `""`      |
| `environment` | The environment for the bucket  | `string` | `""`      |
| `tags`      | A map of tags to assign to the bucket | `map(string)` | `{}` |

## Outputs

| Name        | Description                      |
|-------------|-------------------------------------|
| `bucket_id` | The ID of the created S3 bucket  |
| `bucket_arn`| The ARN of the created S3 bucket |

## Requirements

- Terraform 1.x or higher
- AWS account with necessary permissions to create S3 resources

## Contributing

We welcome contributions! Please feel free to submit a pull request or raise an issue if you encounter any problems or have suggestions for improvement.

## License

This module is licensed under the MIL License. See the [LICENSE](LICENSE) file for details.
