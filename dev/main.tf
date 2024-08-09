# /**
#  * Create by : Benja kuneepong
#  * Date : Wed, Aug  7, 2024 10:45:12 AM
#  * Purpose : ประกาศว่าใช้ terraform version อะไรสำหรับ provider
#  */

 terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 4.67.0"
     }
   }
 }

/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024 10:45:12 AM
 * Purpose : สร้าง bucket สำหรับเก็บ state ของ terraform
 */
terraform {
  backend "s3" {
    bucket  = "test-amazon-linux-dev-terraform-state-bucket"
    key     = "terraform/dev/terraform.tfstate"
    region  = "ap-southeast-1"
    acl     = "bucket-owner-full-control"
    encrypt = true
    access_key = ""
    secret_key = ""
    
  }
}

/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024 10:45:12 AM
 * Purpose : กำหนด provider information
 */
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region   = var.aws_region
  

  default_tags {
    tags = {
      Owner   = var.owner_name
      Service = var.service_name
      System  = var.system_name
      Environment = "${var.environment}"
      Createby    = var.create_by_name
    }
  }
}

