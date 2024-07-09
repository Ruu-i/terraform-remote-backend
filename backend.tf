// create s3

resource "aws_s3_bucket" "tf-backend-state-ru" {
  bucket = "tf-backend-state-ru"


}

resource "aws_s3_bucket_versioning" "tf-backend-versioning_example" {
  bucket = aws_s3_bucket.tf-backend-state-ru.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.tf-backend-state-ru.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_dynamodb_table" "statelocktable" {
  name         = "state-lock-table-20"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}