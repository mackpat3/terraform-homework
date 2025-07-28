resource "aws_instance" "web1" {
  ami = var.ec2_web["ami_id_1"]
  instance_type = var.ec2_web["instance_type1"]
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = local.common_tags
}

resource "aws_instance" "web2" {
  ami = var.ec2_web["ami_id_2"]
  instance_type = var.ec2_web["instance_type2"]
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = local.common_tags
}