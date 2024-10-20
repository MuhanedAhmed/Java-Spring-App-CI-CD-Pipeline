# -------------------------------------------------------------- #
# -------------------- EC2 Module Variables -------------------- #
# -------------------------------------------------------------- #


# --------------------------------------------------------------
# Variables for the security group itself
# --------------------------------------------------------------

variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}


# --------------------------------------------------------------
# Variables for inbound rules
# --------------------------------------------------------------

variable "ingress_rules" {
  description = "A list of ingress rules"
  type = map(object({
    cidr_ipv4                    = string
    referenced_security_group_id = string
    from_port                    = number
    ip_protocol                  = string
    to_port                      = number
  }))
  default = {}
}


# --------------------------------------------------------------
# Variables for outbound rules
# --------------------------------------------------------------

variable "egress_rules" {
  description = "A list of egress rules"
  type = map(object({
    cidr_ipv4   = string
    from_port   = number
    ip_protocol = string
    to_port     = number
  }))

  default = {
    default = {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 0
      ip_protocol = "-1"
      to_port     = 0
    }
  }
}
