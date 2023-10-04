output "region" {
  value = var.region
}
output "vpc" {
  value = aws_vpc.vpc.id
}
output "pub_sub1" {
  value = aws_subnet.pub_sub1.id
}
output "pub_sub2" {
  value = aws_subnet.pub_sub2.id
}
output "private1" {
  value = aws_subnet.privat1.id
}
output "private2" {
  value = aws_subnet.private2.id
}
output "igw" {
  value = aws_internet_gateway.internet_gateway.id
}