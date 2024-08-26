provider "aws" {
  region = "us-east-2"
  # access_key e secret_key podem ser adicionados aqui, se necessário, mas é melhor usar variáveis de ambiente ou um perfil da AWS.
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "main-subnet-a"
  }
}

resource "aws_subnet" "main_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "main-subnet-b"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-gw"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route_table_association" "a_main_a" {
  subnet_id      = aws_subnet.main_a.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "a_main_b" {
  subnet_id      = aws_subnet.main_b.id
  route_table_id = aws_route_table.r.id
}

resource "aws_db_instance" "db" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7.44"      # Versão padrão do MySQL 5.7
  instance_class         = "db.t3.micro" # Classe de instância atualizada
  db_name                = "mydb"
  username               = "admin"
  password               = "admin123" # Considere usar um método seguro para armazenar essa senha
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = "main-db-instance"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow database access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.10.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-security-group"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = [aws_subnet.main_a.id, aws_subnet.main_b.id]

  tags = {
    Name = "main-db-subnet-group"
  }
}
