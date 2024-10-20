# -------------------------------------------------------------- #
# ---------------------- SG Module Outputs --------------------- #
# -------------------------------------------------------------- #

output "SecurityGroup_ID" {
  description = "The ID of the security group"
  value       = aws_security_group.mySG.id
}

