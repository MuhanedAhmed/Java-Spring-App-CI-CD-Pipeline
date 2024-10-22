# --------------------------------------------------------------- #
# --------------------- VPC Module Variables -------------------- #
# --------------------------------------------------------------- #

# --------------------------------------------------------------
# Variables for the VPC
# --------------------------------------------------------------

variable "vpc_ip" {
  type        = string
  description = "A CIDR block for the VPC"
}


# --------------------------------------------------------------
# Variables for public subnets
# --------------------------------------------------------------

variable "public_subnet_IP_1" {
  type        = string
  description = "A CIDR block for the public subnet 1"
}

variable "public_subnet_IP_2" {
  type        = string
  description = "A CIDR block for the public subnet 2"
}

variable "public_subnet_AZ_1" {
  type        = string
  description = "The Availability Zone (AZ) for the public subnet 1"
}

variable "public_subnet_AZ_2" {
  type        = string
  description = "The Availability Zone (AZ) for the public subnet 2"
}


# --------------------------------------------------------------
# Variables for private subnets
# --------------------------------------------------------------

variable "private_subnet1_IP" {
  type        = string
  description = "A CIDR block for the private subnet 1"
}

variable "private_subnet2_IP" {
  type        = string
  description = "A CIDR block for the private subnet 2"
}

variable "private_subnet3_IP" {
  type        = string
  description = "A CIDR block for the private subnet 3"
}

variable "private_subnet4_IP" {
  type        = string
  description = "A CIDR block for the private subnet 4"
}

variable "private_subnet1_AZ" {
  type        = string
  description = "The Availability Zone (AZ) for the private subnet 1"
}

variable "private_subnet2_AZ" {
  type        = string
  description = "The Availability Zone (AZ) for the private subnet 2"
}

variable "private_subnet3_AZ" {
  type        = string
  description = "The Availability Zone (AZ) for the private subnet 3"
}

variable "private_subnet4_AZ" {
  type        = string
  description = "The Availability Zone (AZ) for the private subnet 4"
}
