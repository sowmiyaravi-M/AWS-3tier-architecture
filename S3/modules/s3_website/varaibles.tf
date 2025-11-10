variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "index_document" {
  type        = string
  description = "Index document"
}

variable "error_document" {
  type        = string
  description = "Error document"
}
