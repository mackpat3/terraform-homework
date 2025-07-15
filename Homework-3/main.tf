resource "aws_key_pair" "deployer" {
    key_name = "Bastion-Key"
    public_key = file("~/.ssh/id_rsa.pub")
}