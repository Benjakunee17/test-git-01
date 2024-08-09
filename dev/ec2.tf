/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024  1:59:35 PM
 * Purpose : สร้าง key pair สำหรับ EC2
 */
resource "aws_key_pair" "ec2-instance" {
  key_name   = "ec2"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPXWKGYmr8cjVYoWNsSXk0oy98UTqsFgECYNORTj5D4Z benjakun@NBAHP2460152"

}
/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024  1:59:35 PM
 * Purpose : สร้าง EC2 
 */
resource "aws_instance" "ec2-instance" {
  ami                         = var.ec2_instance_image
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true

  key_name               = aws_key_pair.ec2-instance.key_name
  subnet_id              = "subnet-03bb22f103bf19fa6"
  vpc_security_group_ids = [aws_security_group.ec2_web.id,aws_security_group.ec2_linux.id]
  #user_data = file("user-data.sh")

  root_block_device {
    volume_size           = "30"
    volume_type           = "gp3"
    delete_on_termination = false
  }

  
  tags = {
    Name        = "${var.service_name}-${var.system_name}-ec2-instance-${var.environment}"
    # DailyBackup = "Daily1"
  }
  

  volume_tags = {
    Name        = "${var.service_name}-${var.system_name}-ec2-instance-${var.environment}"
    Service     = var.service_name
    Owner       = var.owner_name
    System      = var.system_name
    Environment = var.environment
    Createby    = var.create_by_name
  }

  # Keep this ami always
  lifecycle {
    ignore_changes = [ami,volume_tags,user_data]
  }

}
