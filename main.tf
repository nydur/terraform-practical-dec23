resource "aws_instance" "web" {
  count = 2
  ami   = data.aws_ami.amazon_linux.id
  # ami                   = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.ssh_key_name
  # vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name        = "${var.name_prefix}-terraform-instance-${count.index}"
    Environment = var.environment
  }
}

# resource "aws_security_group" "allow_ssh" {
#   name        = "c4_sandbox_vpc-default"
#   description = "Allow SSH inbound traffic"
#   vpc_id      = var.vpc_id
# }

#   user_data                   = <<EOF
# #!/bin/bash
# yum install -y httpd
# systemctl enable httpd
# systemctl start httpd
# EOF
#   user_data_replace_on_change = true # this forces instance to be recreated upon update of user data contents
