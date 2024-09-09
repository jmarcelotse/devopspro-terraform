resource "local_file" "exemplo" {
  content  = 50 + 10 + var.valor
  filename = "arquivo.txt"
}
resource "local_file" "exemplo1" {
  content  = 50 - 10 + var.valor
  filename = "arquivo1.txt"
}

resource "local_file" "exemplo2" {
  content  = 50 / var.valor
  filename = "arquivo2.txt"
}

resource "local_file" "exemplo3" {
  content  = 2 * var.valor
  filename = "arquivo3.txt"
}

variable "valor" {
  default = 40
}
