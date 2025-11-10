module "s3_website" {
  source         = "./modules/s3_website"
  bucket_name    = var.bucket_name
  index_document = var.index_document
  error_document = var.error_document
}

module "lambda" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  lambda_runtime       = var.lambda_runtime
  lambda_handler       = var.lambda_handler
  lambda_source_path   = var.lambda_source_path
  dynamodb_table_name  = var.dynamodb_table_name
}

module "dynamodb" {
  source                 = "./modules/dynamodb"
  dynamodb_table_name    = var.dynamodb_table_name
  dynamodb_partition_key = var.dynamodb_partition_key
  read_capacity          = var.dynamodb_read_capacity
  write_capacity         = var.dynamodb_write_capacity
}
