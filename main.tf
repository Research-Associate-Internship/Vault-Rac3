resource "aws_instance" "vault-rac3" {
  ami = "ami-0b4c67d70a6907b93"

  instance_type          = "t2.medium"
  key_name               = "bastion"
  vpc_security_group_ids = [aws_security_group.vault-rac3-SG.id]
  subnets            = ["subnet-0a4c5ede768f52298"]//private subnet

  tags = {
    Name       = "vault-rac3"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}
