#creating a ec2 instance from public1 subnet
resource "aws_instance" "ec2-pub" {
  ami           = var.ami
  instance_type = var.instance-type
  key_name = "tej"
  subnet_id = var.pub_sub1
  security_groups = [var.ec2-sec]
  associate_public_ip_address = true

  tags = {
    Name = "ec2-pub"
  }
}
#creating a ec2 instance from private1 subnet
resource "aws_instance" "ec2_private1" {
  ami           = var.ami
  instance_type = var.instance-type
  key_name = "tej"
  subnet_id = var.private1
  security_groups = [var.private_sec]
  associate_public_ip_address = true

  tags = {
    Name = "ec2_private1"
  }
}
#creating a ec2 instance from private2 subnet
resource "aws_instance" "ec2_private2" {
  ami           = var.ami
  instance_type = var.instance-type
  key_name = "tej"
  subnet_id = var.private2
  security_groups = [var.private_sec]
  associate_public_ip_address = true

  tags = {
    Name = "ec2_private2"
  }
}
