resource "aws_dynamodb_table" "app_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.dynamodb_partition_key

  attribute {
    name = var.dynamodb_partition_key
    type = "S"
  }
}
