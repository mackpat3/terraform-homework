resource "aws_instance" "web" {
  ami           = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
  subnet_id = "subnet-07b4f457d97d9aa7c"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "web1"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  availability_zone = "us-west-2b"
  subnet_id = "subnet-08ff7bccfd2bed827"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "web2"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  availability_zone = "us-west-2c"
  subnet_id = "subnet-090dd60cee7424319"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "web3"
  }
}

