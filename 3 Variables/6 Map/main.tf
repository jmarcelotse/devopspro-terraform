resource "local_file" "foo" {
  content  = "O valor que eu vou usar de maquina é ${var.conteudo["pequena"]}"
  filename = "./arquivo.txt"
}

variable "conteudo" {
  default = {
    "pequena" = "s-1vcpu-2gb"
    "media"   = "s-2vcpu-4gb"
    "grande"  = "s-4vcpu-8gb"
  }
  type        = map(any)
  description = "conteudo que vai para o arquivo.txt"
}
