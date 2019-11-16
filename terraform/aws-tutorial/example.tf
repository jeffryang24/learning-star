provider "aws" {
  version                 = "~> 1.42"
  # Free tier doesn't support east-asia,
  # but you will get it if you request the region to amazon.
  region                  = "us-east-1"
  shared_credentials_file = "/home/jeffryangtoni/.aws/credentials"
  profile                 = "personal"
}

resource "aws_instance" "example" {
  # ami           = "ami-2757f631"
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

