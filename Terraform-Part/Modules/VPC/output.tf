# -------------------------------------------------------------- #
# --------------------- EC2 Module Outputs --------------------- #
# -------------------------------------------------------------- #

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.myvpc.id
}

output "public_subnet_id_1" {
  description = "The ID of public subnet 1"
  value       = aws_subnet.myPublicSubnet_1.id
}

output "public_subnet_id_2" {
  description = "The ID of public subnet 2"
  value       = aws_subnet.myPublicSubnet_2.id
}

output "private_subnet1_id" {
  description = "The ID of private subnet 1"
  value       = aws_subnet.myPrivateSubnet1.id
}

output "private_subnet2_id" {
  description = "The ID of private subnet 2"
  value       = aws_subnet.myPrivateSubnet2.id
}

output "private_subnet3_id" {
  description = "The ID of private subnet 2"
  value       = aws_subnet.myPrivateSubnet3.id

}
output "private_subnet4_id" {
  description = "The ID of private subnet 2"
  value       = aws_subnet.myPrivateSubnet4.id
}
