# Create the S3 bucket
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

# Allow static website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# Disable Block Public Access (required for website hosting)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Public read policy for website content
resource "aws_s3_bucket_policy" "website_policy" {
  depends_on = [aws_s3_bucket_public_access_block.public_access]  # ensures order

  bucket = aws_s3_bucket.website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

# Optional: Upload an index.html file
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  content      = "<html><body><h1>Welcome to My 3-Tier Serverless App!</h1></body></html>"
  content_type = "text/html"
}


