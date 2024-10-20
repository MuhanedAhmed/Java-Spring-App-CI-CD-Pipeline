# -------------------------------------------------------------- #
# -------------------- EC2 Module Variables -------------------- #
# -------------------------------------------------------------- #


# --------------------------------------------------------------
# Variables for the instance itself
# --------------------------------------------------------------

variable "instance_type" {
  type        = string
  description = "The size of the EC2 instance"
}

variable "instance_name" {
  type        = string
  description = "The name of the EC2 instance"
}

variable "instance_ami" {
  type        = string
  description = "The AMI of the EC2 instance"
}

variable "instance_subnet_id" {
  type        = string
  description = "The ID of the subnet in which the EC2 instance will be deployed"
}

variable "private_ip" {
  description = "Optional static private IP address for the instance"
  type        = string
  default     = null
}

variable "userdata" {
  type        = string
  description = "User data to be passed to the instance"
  default     = ""
}

variable "keyname" {
  type        = string
  description = "A key pair to access the EC2"
}

variable "Is_PublicIP" {
  type        = bool
  description = "Whether to assign a public ip address"
  default     = true
}


# --------------------------------------------------------------
# Variables for the security group
# --------------------------------------------------------------

variable "SG_id" {
  type        = string
  description = "The ID of the security group that will be attached to the EC2 instance"
}