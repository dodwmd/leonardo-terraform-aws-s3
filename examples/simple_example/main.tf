
// Create a kms key for this bucket or use a standard kms key when creating the bucket

module "kms_key" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.1" # Check for the latest version on the GitHub page

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