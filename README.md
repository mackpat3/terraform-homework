```hcl
# terraform-homework

region = "us-west-2"
key_name = "Patrick-HW4-key"
port = [22, 80, 443, 3306]
ec2_web = {
    ami_id = "ami-054b7fc3c333ac6d2"
    type = "t2.medium"
    subnet = "subnet-090dd60cee7424319"
}
vpc = {
    cidr = "10.0.0.0/16"
    name = "Patrick-vpc"
}
subnet = [
    { cidr = "10.0.1.0/24", az = "us-west-2a", map_public_ip_on_launch = true, name = "public1"},
    { cidr = "10.0.3.0/24", az = "us-west-2b", map_public_ip_on_launch = true, name = "public2"},
    { cidr = "10.0.5.0/24", az = "us-west-2c", map_public_ip_on_launch = false, name = "private1"},
	{ cidr = "10.0.7.0/24", az = "us-west-2d", map_public_ip_on_launch = false, name = "private2"}
]