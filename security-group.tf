resource "aws_security_group" "vault-SG" {
  name   = "Vault-SG"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.bastion.private_ip)]
  }

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    security_groups = [aws_security_group.ALB-SG.id]
  }

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.builder.private_ip)]
  }

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.jenkins.private_ip)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "Vault-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }

}
