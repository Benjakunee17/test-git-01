/** 
 * Create by : Benja kuneepong
 * Thu, Aug  8, 2024 11:26:14 AM
 * Purpose : สร้าง bucket / กำหนด policy สำหรับการ access control list / กำหนด policy สำหรับการ access ใน bucket
 */
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "${var.service_name}-${var.system_name}-${var.environment}-terraform-state-bucket"
   lifecycle {
     prevent_destroy = false
   }
  tags = {
    Name        = "${var.service_name}-${var.system_name}-${var.environment}-terraform-state-bucket"
    
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
      status     = "Enabled"
      mfa_delete = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  depends_on = [aws_s3_bucket_ownership_controls.terraform_state_bucket]
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_bucket" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}