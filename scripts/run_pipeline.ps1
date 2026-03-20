Write-Host "Step 1: Converting JSON to CSV..."
python (Join-Path $PSScriptRoot "convert_to_csv.py")

if ($LASTEXITCODE -ne 0) {
    Write-Host "CSV conversion failed."
    exit 1
}

Write-Host "Step 2: Uploading CSV to S3..."
& (Join-Path $PSScriptRoot "upload_to_S3.ps1")

if ($LASTEXITCODE -ne 0) {
    Write-Host "S3 upload failed."
    exit 1
}

Write-Host "Pipeline completed successfully."