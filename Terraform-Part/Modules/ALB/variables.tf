# -------------------------------------------------------------- #
# -------------------- ALB Module Variables -------------------- #
# -------------------------------------------------------------- #

variable "lb_name" {
  type        = string
  description = "Name of the LB"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the load balancer"
}

variable "target_instances_ids" {
  type        = map(string)
  description = "Map of target EC2 instance IDs with static keys"
}

variable "Security_Group_id" {
  type        = string
  description = "The ID of the security group"
}


variable "Is_Internal" {
  type        = bool
  description = "Determine whether the ALb is External or Internal"
}

variable "target_group_name" {
  type        = string
  description = "The name of the target group"
}