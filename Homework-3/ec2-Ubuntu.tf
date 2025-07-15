resource "aws_instance" "web" {
  ami           = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache2.sh")

  tags = {
    Name = "Ubuntu"
  }
}

output hello {
    value = aws_instance.web.public_ip
}