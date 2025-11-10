# AWS & Global Settings
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

# S3 Website Configuration
variable "bucket_name" {
  description = "S3 bucket name for hosting the website"
  type        = string
  default     = "my-3tier-static-website-example"
}

variable "index_document" {
  description = "Index document for the S3 static website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the S3 static website"
  type        = string
  default     = "error.html"
}

# Lambda Function Settings
variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "my-serverless-app-function"
}

variable "lambda_runtime" {
  description = "Runtime environment for Lambda"
  type        = string
  default     = "python3.9"
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_source_path" {
  description = "Path to Lambda ZIP file"
  type        = string
  default     = "./lambda_function.zip"
}

# DynamoDB Settings
variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "my-app-data-table"
}

variable "dynamodb_partition_key" {
  description = "Partition key for DynamoDB table"
  type        = string
  default     = "id"
}

variable "dynamodb_read_capacity" {
  description = "Read capacity units"
  type        = number
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "Write capacity units"
  type        = number
  default     = 5
}
