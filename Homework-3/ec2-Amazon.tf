resource "aws_instance" "web2" {
  ami           = "ami-0be5f59fbc80d980c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "Amazon"
  }
}

output hi {
    value = aws_instance.web2.public_ip
}