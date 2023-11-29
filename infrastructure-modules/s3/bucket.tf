resource "random_id" "bucket_config" {
    keepers = {
        storage_unique_id = var.storage_unique_id
    }

    byte_length = 8    
}

resource "aws_s3_bucket" "this" {
    bucket = "${var.env}-${var.name}-${random_id.bucket_config.hex}"
    force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
    bucket = aws_s3_bucket.this.id
    versioning_configuration {
        status = var.versioning ? "Enabled" : "Disabled"
    }
}

resource "aws_s3_bucket_public_access_block" "bucket_access_block" {
    bucket = aws_s3_bucket.this.id

    block_public_acls       = var.block_public_acls
    block_public_policy     = var.block_public_policy
    ignore_public_acls      = var.ignore_public_acls
    restrict_public_buckets = var.restrict_public_buckets
}