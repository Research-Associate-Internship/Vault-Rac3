resource "aws_instance" "vault" {
  ami = "ami-007855ac798b5175e"

  instance_type          = "t2.medium"
  key_name               = "bastion"
  vpc_security_group_ids = [aws_security_group.vault-SG.id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Name       = "vault"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}
