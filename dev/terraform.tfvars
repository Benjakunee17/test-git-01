/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024  2:17:48 PM
 * Purpose : ประกาศตัวแปลเพื่อใช้ในแต่ละ resource
 */

aws_region = "ap-southeast-1"
access_key = ""
secret_key = ""

owner_name     = "benja"
system_name    = "amazon-linux"
service_name   = "test"
project_name   = "no"
environment    = "dev"
create_by_name = "Miss. benja kuneepong created by terraform for tutorial"

#default vpc
vpc_id             = "vpc-02fbc1d5d4461fd7c"
subnet_app_b       = ""
subnet_app_c       = ""
subnet_nonexpose_b = ""
subnet_nonexpose_c = ""
subnet_secure_b    = ""
subnet_secure_c    = ""
#amazon linux
ec2_instance_image = "ami-0a6b545f62129c495" 
ec2_instance_type  = "t2.micro"

#rds mysql
rds_engine                    = "mysql"
rds_engine_version            = "8.0.36"
rds_multi_az                  = "true"
rds_storage_type              = "gp2"
rds_allocated_storage         = "100"
rds_max_allocated_storage     = "440"
rds_admin                     = "admin"
rds_password                  = "vCXPp9mZISDGlpaniET8"
rds_database_name             = "DB"
rds_instance_type             = "db.m5.large"
rds_ca_cert_identifier        = "rds-ca-rsa4096-g1"
