resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "private_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls]

  bucket = aws_s3_bucket.this.id
  acl    = "private"
}