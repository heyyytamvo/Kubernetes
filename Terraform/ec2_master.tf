# Security Group for EC2
resource "aws_security_group" "Master_Node_SG" {
  name        = "Master_Node_SG"
  description = "Allow HTTP inbound and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow inbound traffic on port 80"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      from_port        = 1024
      to_port          = 65535
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow inbound traffic on port 80"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["0.0.0.0/0"],
      description      = "Allow inbound ICMP Traffic"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow inbound traffic on port 22"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Master Node SG"
  }
}

# resource "aws_instance" "Master_Node_1" {

#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type
#   key_name                    = aws_key_pair.EC2key.key_name
#   monitoring                  = true
#   subnet_id                   = values(aws_subnet.public_subnets)[1].id
#   vpc_security_group_ids      = [aws_security_group.Master_Node_SG.id]
#   associate_public_ip_address = true

#   user_data = file("${path.module}/ec2_master_user_data.sh")
#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name        = "Master Node 1"
#   }
# }

# resource "aws_instance" "Master_Node_2" {

#   ami                         = var.ec2_ami
#   instance_type               = var.ec2_instance_type
#   key_name                    = aws_key_pair.EC2key.key_name
#   monitoring                  = true
#   subnet_id                   = values(aws_subnet.public_subnets)[1].id
#   vpc_security_group_ids      = [aws_security_group.Master_Node_SG.id]
#   associate_public_ip_address = true

#   user_data = file("${path.module}/ec2_master_user_data.sh")
#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Name        = "Master Node 2"
#   }
# }