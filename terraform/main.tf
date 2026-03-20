provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "spotify_data" {
  bucket = var.bucket_name

  tags = {
    Name        = "Spotify Data Bucket"
    Project     = "AWSSpotifyProject"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "spotify_data_versioning" {
  bucket = aws_s3_bucket.spotify_data.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "spotify_data_pab" {
  bucket = aws_s3_bucket.spotify_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}