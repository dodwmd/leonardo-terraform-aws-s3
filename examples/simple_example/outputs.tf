output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = module.wizardai_aws_s3_bucket.bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.wizardai_aws_s3_bucket.bucket_arn
}