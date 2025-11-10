output "s3_website_url" {
  description = "URL of the S3 static website"
  value       = module.s3_website.website_endpoint
}

output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = module.lambda.lambda_function_name
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = module.dynamodb.table_name
}
