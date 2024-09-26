terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "wp_net" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "wp-network"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wp_net.id

  tags = {
    Name = "wp-igw"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.wp_net.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "wp-route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.wp_subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.wp_subnet_b.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_subnet" "wp_subnet_a" {
  vpc_id            = aws_vpc.wp_net.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "wp-subnet-a"
  }
}

resource "aws_subnet" "wp_subnet_b" {
  vpc_id            = aws_vpc.wp_net.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "wp-subnet-b"
  }
}

resource "aws_lb" "wp_lb" {
  name               = "wp-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.wp_subnet_a.id, aws_subnet.wp_subnet_b.id]

  tags = {
    Name = "wp-lb"
  }
}

resource "aws_lb_listener" "wp_lb_listener" {
  load_balancer_arn = aws_lb.wp_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wp_tg.arn
  }
}

resource "aws_lb_target_group" "wp_tg" {
  name     = "wp-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.wp_net.id
}

resource "aws_instance" "vm_wp" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 AMI para us-east-2
  instance_type = var.instance_type
  subnet_id     = aws_subnet.wp_subnet_a.id
  count         = var.wp_vm_count

  # Adicionando a chave PEM para acesso via SSH
  key_name = var.key_name

  tags = {
    Name = "vm-wp-${count.index}"
  }
}

resource "aws_instance" "vm_nfs" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 AMI para us-east-2
  instance_type = var.instance_type
  subnet_id     = aws_subnet.wp_subnet_b.id

  # Adicionando a chave PEM para acesso via SSH
  key_name = var.key_name

  tags = {
    Name = "vm-nfs"
  }
}

resource "aws_db_instance" "wp_mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "wp_database"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "wp-mysql"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "wp-db-subnet-group"
  subnet_ids = [aws_subnet.wp_subnet_a.id, aws_subnet.wp_subnet_b.id]

  tags = {
    Name = "wp-db-subnet-group"
  }
}

resource "aws_security_group" "db_sg" {
  name   = "db-security-group"
  vpc_id = aws_vpc.wp_net.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}

# Criação do Papel IAM para acesso ao SSM
resource "aws_iam_role" "ssm_role" {
  name = "SSMRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ssm_access" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}
