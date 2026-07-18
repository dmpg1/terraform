# Create S3 Bucket           --------------------------- PUBLIC BUCKET -----------------------------------------------------|
resource "aws_s3_bucket" "example" {
  bucket = "example"
}
# Disable Public Access Block
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Configure the Bucket ACL for public read
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}
# -------------------------------------------------- PUBLIC BUCKET ---------------------------------------------------------|


# -------------------------------------------------- PRIVATE BUCKET --------------------------------------------------------|

resource "aws_s3_bucket" "example" {
  bucket = "example"
}
# Disable Public Access Block
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

