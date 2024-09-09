resource "local_file" "exemplo" {
  content  = trimspace("Docker                     ")
  filename = "arquivo.txt"
}
