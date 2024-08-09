/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024 10:45:12 AM
 * Purpose : ประกาศตัวแปลเริิ่มต้นเพื่อไปใช้ในไฟล์​ var ของแต่ละ environment
 */



variable "aws_region" { default = "ap_southeast_1" }
variable "access_key" {}
variable "secret_key" {}

variable "owner_name" {}
variable "service_name" {}
variable "system_name" {}
variable "project_name" {}
variable "environment" {}
variable "create_by_name" {}

variable "vpc_id" {}
variable "subnet_app_b" {}
variable "subnet_app_c" {}
variable "subnet_nonexpose_b" {}
variable "subnet_nonexpose_c" {}
variable "subnet_secure_b" {}
variable "subnet_secure_c" {}

variable "ec2_instance_image" {}
variable "ec2_instance_type" {}

variable "rds_admin"                    {}
variable "rds_password"                 {}
variable "rds_database_name"            {}
variable "rds_instance_type"            {}
variable "rds_ca_cert_identifier"       {}
variable "rds_engine"                   {}
variable "rds_engine_version"           {}
variable "rds_multi_az"                 {}
variable "rds_storage_type"             {}
variable "rds_allocated_storage"        {}
variable "rds_max_allocated_storage"    {}
