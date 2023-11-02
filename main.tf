resource "aws_instance" "vault-rac3" {
  ami = "ami-0b4c67d70a6907b93"

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
