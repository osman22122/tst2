provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_instance" "test1-ripple" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.test.id}"
}

resource "aws_subnet" "test" {
 vpc_id = "${aws_vpc.main.id}"
 cidr_block = "10.0.1.0/24"
 tags = {
   Name = "test_subnet1"
 }
}

