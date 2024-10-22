# ----------------------------------------------------------------------------- #
# ------------------------------- VPC Module ---------------------------------- #
# ----------------------------------------------------------------------------- #

# ---------------------------------------------------------------------
# Creating a VPC
# ---------------------------------------------------------------------

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_ip

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

# ---------------------------------------------------------------------
# Creating public and private subnets
# ---------------------------------------------------------------------

resource "aws_subnet" "myPublicSubnet_1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet_IP_1
  availability_zone = var.public_subnet_AZ_1

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

resource "aws_subnet" "myPublicSubnet_2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet_IP_2
  availability_zone = var.public_subnet_AZ_2

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

resource "aws_subnet" "myPrivateSubnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet1_IP
  availability_zone = var.private_subnet1_AZ

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

resource "aws_subnet" "myPrivateSubnet2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet2_IP
  availability_zone = var.private_subnet2_AZ

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

resource "aws_subnet" "myPrivateSubnet3" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet3_IP
  availability_zone = var.private_subnet3_AZ

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

resource "aws_subnet" "myPrivateSubnet4" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet4_IP
  availability_zone = var.private_subnet4_AZ

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

# ---------------------------------------------------------------------
# Creating an Internet Gateway
# ---------------------------------------------------------------------

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}


# ----------------------------------------------------------------------
# Creating a public route table and associate it with the public subnets
# ----------------------------------------------------------------------

# Creating a route table.
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}


# Associating the route table with the subnets.
resource "aws_route_table_association" "Subnet-RouteTable-Association1" {

  subnet_id      = aws_subnet.myPublicSubnet_1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "Subnet-RouteTable-Association2" {

  subnet_id      = aws_subnet.myPublicSubnet_2.id
  route_table_id = aws_route_table.public-route-table.id
}


# ------------------------------------------------------------------------
# Creating Elastic IP and NAT Gateway
# ------------------------------------------------------------------------

resource "aws_eip" "eip-nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.myPublicSubnet_1.id

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }


  depends_on = [aws_internet_gateway.gw]
}


# ------------------------------------------------------------------------
# Creating a private route table and associate it with the private subnets
# ------------------------------------------------------------------------

# Creating route table.
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT.id
  }

  tags = {
    Deployment  = "Terraform"
    Environment = "Task"
  }
}

# Associating the route table with subnets.
resource "aws_route_table_association" "Subnet-RouteTable-Association4" {

  subnet_id      = aws_subnet.myPrivateSubnet1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "Subnet-RouteTable-Association5" {

  subnet_id      = aws_subnet.myPrivateSubnet2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "Subnet-RouteTable-Association6" {

  subnet_id      = aws_subnet.myPrivateSubnet3.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "Subnet-RouteTable-Association7" {

  subnet_id      = aws_subnet.myPrivateSubnet4.id
  route_table_id = aws_route_table.private-route-table.id
}