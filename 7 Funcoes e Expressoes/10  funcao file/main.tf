resource "local_file" "exemplo" {
  content  = file("/home/jmarcelotse/.ssh/id_rsa.pub")
  filename = "arquivo.txt"
}
