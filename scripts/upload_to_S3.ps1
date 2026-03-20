$csvPath = Join-Path $PSScriptRoot "..\data\spotify_liked_songs_athena.csv"
$csvPath = [System.IO.Path]::GetFullPath($csvPath)

$bucketPath = "s3://niko-spotify-data-devops/csv/spotify_liked_songs_athena.csv"

Write-Host "Uploading CSV to S3..."
Write-Host "Local file: $csvPath"

if (-not (Test-Path $csvPath)) {
    Write-Host "File not found: $csvPath"
    exit 1
}

aws s3 cp $csvPath $bucketPath

if ($LASTEXITCODE -ne 0) {
    Write-Host "Upload failed."
    exit 1
}

Write-Host "Upload complete."