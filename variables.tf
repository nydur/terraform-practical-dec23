variable "name_prefix" {
  type    = string
  default = "rudyn"
}

variable "environment" {
  type    = string
  default = "development"
}

variable "vpc_id" {
  type    = string
  default = true
  # default = "vpc-0582d885a3bc6c51b"
}

variable "public_subnet_id" {
  type    = string
  default = true
  # default = "subnet-0e89cf792598a2ba4"
}

variable "ssh_key_name" {
  type    = string
  default = "rudyn-ssh"
}

# variable "ec2_count" {
#   count = "2"
# }