# -------------------------------------------------------------- #
# --------------------- EC2 Module Outputs --------------------- #
# -------------------------------------------------------------- #


output "EC2_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.myServer.id
}