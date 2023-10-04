#creating vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  
   tags = {
    Name = "${var.project_name}-vpc"
  }
}
#creating a internet gate way
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id
  
    tags = {
        Name = "${var.project_name}-igw"
    }
}
#creating a internet gate way attachment
resource "aws_internet_gateway_attachment" "int-attach" {
  internet_gateway_id = aws_internet_gateway.internet_gateway.id
  vpc_id              = aws_vpc.vpc.id
}
#creating a public subnets 1
resource "aws_subnet" "pub_sub1" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.public1_cidr
    availability_zone = var.availability_zone1
    map_public_ip_on_launch = true

    tags = {
      Name = "pub_sub1"
    }
}
#creating a public subnets 2
resource "aws_subnet" "pub_sub2" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block =var.public2_cidr
    availability_zone = var.availability_zone2
    map_public_ip_on_launch = true

    tags = {
      Name = "pub_sub2"
    }
}
#create a route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public"
  }
}
#attaching a route table subnet attachment
resource "aws_route_table_association" "rts1" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.public.id
}
#attaching a route table subnet attachment
resource "aws_route_table_association" "rts2" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.public.id
}
#creating a private subnets 1
resource "aws_subnet" "privat1" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.private1_cidr
    availability_zone = var.availability_zone1
    map_public_ip_on_launch  = false

    tags = {
      Name = "private1"
    }
}
#creating a private subnets 2
resource "aws_subnet" "private2" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.private2_cidr
    availability_zone = var.availability_zone2
    map_public_ip_on_launch  = false

    tags = {
      Name = "private2"
    }
}
#creating a private rds subnets
resource "aws_subnet" "sub_rds1" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.sub_rds1
    availability_zone = var.availability_zone1
    map_public_ip_on_launch  = false

    tags = {
      Name = "sub_rds1"
    }
}
#creating a private rds subnets
resource "aws_subnet" "sub_rds2" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = var.sub_rds2
    availability_zone = var.availability_zone2
    map_public_ip_on_launch  = false

    tags = {
      Name = "sub_rds2"
    }
}
#create a route table for rds subnets
resource "aws_route_table" "rds_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public"
  }
}
#attaching a route table rds subnet attachment
resource "aws_route_table_association" "rds_ass1" {
  subnet_id      = aws_subnet.sub_rds1.id
  route_table_id = aws_route_table.rds_route.id
}
#attaching a route table rds subnet attachment
resource "aws_route_table_association" "rds_ass2" {
  subnet_id      = aws_subnet.sub_rds2.id
  route_table_id = aws_route_table.rds_route.id
}