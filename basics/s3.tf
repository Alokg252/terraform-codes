// create s3
resource "aws_s3_bucket" "mybucket" {
    bucket = var.bucket_name
    tags = {
      Name: "MyBucket" 
    }
}

// off public access block (making s3 publically accessible)
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.mybucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

// bucket policy to allow public access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.mybucket.id
  policy = jsondecode(
    {
        Version = "2012-10-17",
        Statement = [
            {
                Sid = "PublicReadGetObject",
                Effect= "Allow",
                Principal = "*",
                Action = [
                    "s3:GetObject"
                ],
                Resource = [
                    "arn:aws:s3:::${var.bucket_name}/*"
                ]
            }
        ]
    }
  )
  
}

// enable static website hosting for s3
resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

// upload index file to s3
resource "aws_s3_object" "bucket_object" {
    bucket = aws_s3_bucket.mybucket.id // bucket name
    source = "./data/index.html" // file path in local
    key = "index.html" // file name in s3 
    content_type = "text/html"
}

// upload error file to s3
resource "aws_s3_object" "bucket_object" {
    bucket = aws_s3_bucket.mybucket.id // bucket name
    source = "./data/error.html" // file path in local
    key = "error.html" // file name in s3 
    content_type = "text/html"
}

// upload css file to s3
resource "aws_s3_object" "bucket_object" {
    bucket = aws_s3_bucket.mybucket.id // bucket name
    source = "./data/style.css" // file path in local
    key = "style.css" // file name in s3 
    content_type = "text/css"
}
