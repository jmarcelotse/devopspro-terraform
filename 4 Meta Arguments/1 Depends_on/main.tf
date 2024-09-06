resource "local_file" "arquivo" {
  content    = "Esse é o conteudo do arquivo 1"
  filename   = "./arquivo1.txt"
  depends_on = [local_file.outro_arquivo]
}

resource "local_file" "outro_arquivo" {
  content  = "Esse é o conteudo do arquivo 2"
  filename = "./arquivo2.txt"
}
