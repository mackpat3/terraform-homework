resource "aws_instance" "web" {
  ami = var.ec2_web.ami_id  
  instance_type = var.ec2_web.type
  tags = local.common_tags
}