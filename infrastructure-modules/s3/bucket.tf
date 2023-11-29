resource "random_id" "bucket_config" {
  keepers = {
    storage_unique_id = var.storage_unique_id
  }

  byte_length = 8
}

resource "aws_s3_bucket" "this" {
  bucket        = "${var.env}-${var.name}-${random_id.bucket_config.hex}"
  force_destroy = true
}
