
// Create a kms key for this bucket or use a standard kms key when creating the bucket

module "kms_key" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-kms.git?ref=c20bffd41ce9716140cb9938faf0aa147b38ca2a"

  description             = "KMS key for WizardAI S3 bucket encryption"
  deletion_window_in_days = 10 # How long to wait before deletion
  key_usage               = "ENCRYPT_DECRYPT"

  # Enable automatic rotation of the key every year
  enable_key_rotation = true

  # Tags for the KMS key
  tags = {
    Environment = var.environment
    Project     = var.name
  }
}


module "wizardai_aws_s3_bucket" {
  source = "../../modules/wizardai_aws_s3_bucket"

  name        = var.name
  environment = var.environment

  encryption_algorithm = "aws:kms"
  kms_key_id           = module.kms_key.key_id

  tags = {
    Environment = var.environment
    Project     = var.name
  }
}