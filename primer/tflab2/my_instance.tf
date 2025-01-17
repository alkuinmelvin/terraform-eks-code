# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_instance.i-07ecaaf125c9a6807:
resource "aws_instance" "myinstance" {
  count = var.mycount
  ami   = data.aws_ami.amazon_linux.id

  associate_public_ip_address = false
  availability_zone           = data.aws_availability_zones.az.names[0]

  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  instance_type        = "t2.micro"
  monitoring           = false

  source_dest_check = true
  subnet_id         = aws_subnet.myprivsubnet[count.index].id
  tags = {
    "Name" = format("instance-10-%s-4-first", count.index + 1)
  }
  tenancy = "default"
  lifecycle {
    ignore_changes = [user_data, user_data_base64]
  }
  #user_data_base64 = "IyEvYmluL2Jhc2gKCnl1bSB1cGRhdGUgLXkKCmN1cmwgaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9BbnRvbmlvRmVpamFvVUsvZDg1MzNhNzFlNWVjZmYyOTcxZjY4NTlhN2JlNDI2ZGEvcmF3LzNkMDkzMDAwNGI5MzdmNmRkN2YyNzMwMjEyMTgzMjdiNzEyOWQ2MDkvYXdzLWVjMi11c2VyZGF0YS1sYW5kaW5nLXdlYnBhZ2Uuc2ggfCBiYXNoCgo="
  user_data = file("user_data.sh")
  volume_tags = {
    "Name" = format("instance-10-%s-4-first", count.index + 1)
  }
  vpc_security_group_ids = [
    aws_security_group.mysg[count.index].id,
  ]

  credit_specification {
    cpu_credits = "standard"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 8
    volume_type           = "gp2"
  }

  timeouts {}
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.test_role.name
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
