resource "aws_s3_bucket" "this" {
  bucket = "my-unique-bucket-name-123"
  acl    = "private"

  lifecycle {
    create_before_destroy = true   # Creates a new resource before destroying the old one
    prevent_destroy       = true   # Prevents accidental deletion of the resource
    ignore_changes        = [acl]  # Ignores changes to the 'acl' argument
    replace_triggered_by  = [aws_s3_bucket.example.bucket] # Replaces resource if bucket name changes
  }
}

resource "aws_s3_bucket_object" "file" {
  bucket = aws_s3_bucket.this.id
  key    = "sample.txt"
  source = "sample.txt"

  depends_on = [aws_s3_bucket.this] # Explicit dependency
}