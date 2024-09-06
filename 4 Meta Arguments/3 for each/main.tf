resource "local_file" "arquivo" {
  content  = "Esse é o conteudo do arquivo - ${each.key}"
  filename = "./arquivo-${each.key}.txt"
  for_each = var.contador
}

variable "contador" {
  default = ["Maquina01", "Maquina02", "Maquina03"]
  type    = set(string)

}
