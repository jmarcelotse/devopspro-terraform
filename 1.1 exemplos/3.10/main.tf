provider "aws" {
  region = "us-east-2"
}

variable "instances" {
  description = "Map of instance names to instance types"
  type        = map(string)
  default = {
    "web" = "t2.micro",
    "db"  = "t2.medium"
  }
}

resource "aws_instance" "multiple_instances" {
  for_each = var.instances

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

output "instance_ids" {
  value = [for inst in aws_instance.multiple_instances : inst.id]
}
