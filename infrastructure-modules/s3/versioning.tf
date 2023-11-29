resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Disabled"
  }
}