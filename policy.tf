resource "aws_iam_role" "test_role" {
  name = "${var.name_prefix}-test_role"

  assume_role_policy = <<EOF
    {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  }
  EOF
}

#   tags = {
#     tag-key = "tag-value"
#   }
# }

resource "aws_iam_instance_profile" "test_profile" {
  name = "${var.name_prefix}-test_profile"
  role = aws_iam_role.role.name
}

# resource "aws_iam_policy_attachment" "test-attach" {
#   role       = aws_iam_role.role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }