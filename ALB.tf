resource "aws_lb" "vault-rac3-alb" {
  name               = "vault-rac3-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.ALB-rac3.id]

  subnets = ["subnet-03751da93d63a01ba","subnet-035ab2b764ab394a7"]//public subnets

  tags = {
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    Project    = "intern"
  }

}

resource "aws_lb_target_group" "vault-rac3-tg" {
  name     = "vault-rac3-tg"
  port     = 8200
  protocol = "HTTP"
  vpc_id   = "vpc-09e3a6b6a5f9f30ad"

  health_check {
    path = "/"
  }

  tags = {
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    Project    = "intern"
  }

}
#instance must be running to attach
resource "aws_lb_target_group_attachment" "vault-rac3-attach" {
  target_group_arn = aws_lb_target_group.vault-rac3-tg.arn
  target_id        = aws_instance.vault-rac3.id
  port             = 8200
}
resource "aws_lb_listener" "vault-rac3-tg" {
  load_balancer_arn = aws_lb.vault.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "vault-tg-443" {
  load_balancer_arn = aws_lb.vault-rac3-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/e2da0f86-f6cb-4252-b68f-92785c07613b"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vault-rac3-tg.arn
  }
}
