terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
   }
 }
}

provider "aws" {
 region  = "us-east-1"
 profile = "dgarcia232@soyudemedellin.edu.co"
}

resource "aws_instance" "app_server" {
 ami           = "ami-0ff8a91507f77f867"
 instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo docker pull -p jorgemesa19/ecommerce:back01
    sudo docker run -d -p 4201:4201 jorgemesa19/ecommerce:back01
    sudo docker pull jorgemesa19/ecommerce:admin01
    sudo docker run -p 4200:4200 jorgemesa19/ecommerce:admin01
    sudo docker pull jorgemesa19/ecommerce:tienda01
    sudo docker run -p 55466:55466 jorgemesa19/ecommerce:tienda01
  EOF

 security_groups = [aws_security_group.allow_ssh.name]

 # https://github.com/hashicorp/terraform-provider-aws/issues/23315
 user_data_replace_on_change = true


 tags = {
   Name = "dgarcia232@soyudemedellin.edu.co"
 }
}

resource "aws_security_group" "allow_ssh" {
 name        = "allow_ssh-dgarcia232@soyudemedellin.edu.co"
 description = "Allow ssh inbound traffic"


 ingress {
   description      = "SSH from VPC"
   from_port        = 80
   to_port          = 80
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }


 egress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }


 tags = {
   Name = "allow_ssh"
 }
}
