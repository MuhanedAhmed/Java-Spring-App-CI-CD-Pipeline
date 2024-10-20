# ----------------------------------------------------------------------------- #
# ------------------------------- EC2 Module ---------------------------------- #
# ----------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------
# Creating EC2 Instance
# -------------------------------------------------------------------------------

resource "aws_instance" "myServer" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = var.instance_subnet_id
  private_ip                  = var.private_ip
  associate_public_ip_address = var.Is_PublicIP
  key_name                    = var.keyname
  vpc_security_group_ids      = [var.SG_id]
  user_data                   = var.userdata

  tags = {
    Name        = var.instance_name
    Deployment  = "Terraform"
    Environment = "Task"
  }
}