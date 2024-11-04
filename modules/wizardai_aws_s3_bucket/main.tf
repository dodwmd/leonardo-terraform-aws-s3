# main.tf

module "this" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git?ref=d8ad14f2da0179178030c8876de84458aa7495e9"

  bucket = format("wizardai-%s-%s", var.name, var.environment)

  acl                     = "private"
  force_destroy           = var.force_destroy
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  # Encryption settings
  server_side_encryption_configuration = [
    {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = var.encryption_algorithm
        kms_master_key_id = var.kms_key_id
      }
    }
  ]

  # Policy to enforce HTTPS-only access (encryption in transit)
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          format("arn:aws:s3:::%s/*", format("wizardai-%s-%s", var.name, var.environment)),
          format("arn:aws:s3:::%s", format("wizardai-%s-%s", var.name, var.environment))
        ],
        "Condition" : {
          "Bool" : {
            "aws:SecureTransport" : "false"
          }
        }
      }
    ]
  })

  tags = var.tags
}
