variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime"
}

variable "handler" {
  type        = string
  description = "Lambda handler"
}

variable "role_arn" {
  type        = string
  description = "IAM role ARN for Lambda execution"
}

variable "bucket" {
  type        = string
  description = "S3 bucket containing Lambda code"
}

variable "s3_key" {
  type        = string
  description = "S3 key for Lambda ZIP file"
}

variable "memory_size" {
  type        = number
  description = "Memory size in MB"
}

variable "timeout" {
  type        = number
  description = "Timeout in seconds"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the Lambda function"
}
variable "source_path" {
  type        = string
  description = "Path to zipped Lambda code"
}