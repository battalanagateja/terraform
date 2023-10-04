#allow elastic ip
#creating a elastic ip
resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    name = "eip"
  }
}
#creating a natgate way for subnets
resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.pub_sub1

  tags = {
    Name = "nat1"
  }
}
#creating a route table for private subnets
resource "aws_route_table" "route3" {
  vpc_id = var.vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }
  tags = {
    Name = "route3"
  }
}
#creating a route table association
resource "aws_route_table_association" "rts3" {
  subnet_id      = var.private1
  route_table_id = aws_route_table.route3.id
}
#creating a route table association
resource "aws_route_table_association" "rts4" {
  subnet_id      = var.private2
  route_table_id = aws_route_table.route3.id
}