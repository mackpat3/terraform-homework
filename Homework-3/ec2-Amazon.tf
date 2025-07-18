data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250707.0-kernel-6.1-x86_64"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.amazon.id
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