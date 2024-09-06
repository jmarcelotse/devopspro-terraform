resource "local_file" "foo" {
  content  = "O valor que eu vou usar de maquina é ${var.conteudo[2]}"
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default     = ["Maquina01", "Maquina02", "Maquina03", "Maquina04", ]
  type        = list(string)
  description = "conteudo que vai para o arquivo.txt"
}
