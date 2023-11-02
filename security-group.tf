resource "aws_security_group" "vault-rac3-SG" {
  name   = "Vault-rac3-SG"
  vpc_id = "vpc-09e3a6b6a5f9f30ad"

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    security_groups = [aws_security_group.ALB-rac3.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "Vault-rac3-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }

}
resource "aws_security_group" "ALB-rac3" {
  name   = "ALB-rac3"
  vpc_id = "vpc-09e3a6b6a5f9f30ad"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "ALBSG-rac3-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }

}
