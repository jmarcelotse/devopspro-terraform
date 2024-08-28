resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id     = aws_vpc.this.id
  cidr_block = element(var.public_subnets, count.index)

  tags = {
    Name = "example-public-subnet-${count.index + 1}"
  }
}
