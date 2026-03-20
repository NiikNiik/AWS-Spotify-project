output "bucket_name" {
  value = aws_s3_bucket.spotify_data.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.spotify_data.arn
}