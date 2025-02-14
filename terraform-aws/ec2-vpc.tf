provider "aws" {
	region = "us-east-1"
} 

resource "aws_key_pair" "mykey" {
         key_name = "terra-key"
         public_key = file("/home/ubuntu/.ssh/terra-key.pub")

}


resource "aws_default_vpc" "default_vpc" {

}


resource "aws_security_group" "allow_ssh" {
 name = "allow_ssh"
 description = "allow ssh inbound traffic"
 vpc_id = aws_default_vpc.default_vpc.id
 

 ingress {
    description = "TLS from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}
    tags = {
	Name = "allow_ssh"
}
}



#resource "aws_instance" "vpc-instance" {
#         key_name = aws_key_pair.key_name
#}


resource "aws_instance" "my-vpc-instance" {
	 key_name = aws_key_pair.mykey.key_name
 	 ami = var.ec2-ubuntu-ami
 	 instance_type = "t2.micro"
	 security_groups = [aws_security_group.allow_ssh.name]
	 

	tags = {
	Name = "newest-secured-instance"
}
}


















