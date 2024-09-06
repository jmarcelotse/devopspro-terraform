resource "local_file" "arquivo" {
  #content  = "Esse é o conteudo do arquivo - ${count.index}"
  content = "Esse é o conteudo do arquivo - ${count.index + 1}" #assim começa do 1
  #filename = "./arquivo${count.index}.txt"
  filename = "./arquivo${count.index + 1}.txt" #assim começa do 1
  #count    = 4
  count = var.contador
}

variable "contador" {
  default = 10
}
