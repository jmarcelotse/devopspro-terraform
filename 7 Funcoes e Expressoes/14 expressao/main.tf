resource "local_file" "exemplo" {
  content  = var.valor > 10 ? "Maior" : "menor"
  filename = "arquivo.txt"
}


resource "local_file" "exemplo1" {
  content  = var.valor == 10
  filename = "arquivo.txt1"
}

variable "valor" {
  default = 11
}
