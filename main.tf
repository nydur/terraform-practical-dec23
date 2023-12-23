resource "aws_instance" "web" {
  ami                         = "ami-0e4b5d31e60aa0acd"
  instance_type               = "t2.micro"
  key_name                    = "rudyn-ssh"
  subnet_id                   = "subnet-0e89cf792598a2ba4"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "rudyn-terraform-instance"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "c4_sandbox_vpc-default"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0582d885a3bc6c51b"
}
