# variables.tf

variable "name" {
  description = "base name of the bucket"
  type        = string
}

variable "environment" {
  description = "Environment for the resource (e.g., development, staging, production)"
  type        = string
  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be one of 'development', 'staging', or 'production'."
  }
}

variable "encryption_algorithm" {
  description = "Encryption algorithm for server-side encryption at rest"
  type        = string
  default     = "AES256"
}

variable "kms_key_id" {
  description = "KMS Key ID for SSE-KMS encryption (optional)"
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Flag to enable force deletion of S3 bucket (default: false)"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to assign to the S3 bucket"
  type        = map(string)
  default     = {}
}
