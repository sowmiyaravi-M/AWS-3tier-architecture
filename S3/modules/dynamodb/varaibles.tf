variable "dynamodb_table_name" {
  type = string
}

variable "dynamodb_partition_key" {
  type = string
}

variable "read_capacity" {
  type = number
}

variable "write_capacity" {
  type = number
}
