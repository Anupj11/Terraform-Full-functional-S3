resource "aws_s3_bucket" "bucket" {
  bucket = "demo-public-bucket-7498248905"
}

resource "aws_s3_bucket_versioning" "versoning" {

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    
    status = "Enabled"
  }
   
}

resource "aws_s3_bucket_lifecycle_configuration" "transition-lifecycle" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "full-transition-lifecycle"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    /* transition {
      days          = 60
      storage_class = "ONEZONE_IA"
    } */
    

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }

    # FIX 1: Must be GLACIER_IR + 90 = 180+
    transition {
      days          = 180
      storage_class = "GLACIER"
    }

    # FIX 2: Must be GLACIER + 90 = 270+
    transition {
      days          = 270
      storage_class = "DEEP_ARCHIVE"
    }

    expiration {
      days = 365
    }

    noncurrent_version_expiration {
      noncurrent_days = 60
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

output "s3_bucket_arn" {

  value = aws_s3_bucket.bucket.arn
  
}

output "s3_bucket_name" {

  value = aws_s3_bucket.bucket.bucket_domain_name
  
}