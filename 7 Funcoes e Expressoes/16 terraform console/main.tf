resource "local_file" "exemplo" {
  content  = join(", ", [for v in var.valor : upper(v)])
  filename = "arquivo.txt"
}


variable "valor" {
  default = ["Docker", "Jenkins", "Terraform"]
}
