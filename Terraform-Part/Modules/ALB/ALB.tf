# ----------------------------------------------------------------------------- #
# ------------------------------- ALB Module ---------------------------------- #
# ----------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------
# Creating Application Load Balancer
# -------------------------------------------------------------------------------


resource "aws_lb" "my_alb" {
  name               = var.lb_name
  internal           = var.Is_Internal
  load_balancer_type = "application"
  security_groups    = [var.Security_Group_id]
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "my_target_group" {
  name        = var.target_group_name
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "my_attachment" {
  for_each         = var.target_instances_ids
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = each.value
}