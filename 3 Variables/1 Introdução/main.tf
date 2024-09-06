resource "local_file" "foo" {
  content  = "conteudo do arquivo"
  filename = "./arquivo.txt"
}
