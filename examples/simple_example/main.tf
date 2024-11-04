module "wizardai_aws_s3_bucket" {
  source = "../../modules/wizardai_aws_s3_bucket"

  name        = var.name
  environment = var.environment
}