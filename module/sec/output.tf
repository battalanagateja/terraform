output "ec2-sec" {
  value = aws_security_group.ec2-sec.id
}
output "private_sec" {
  value = aws_security_group.private_sec.id
}