resource "local_file" "exemplo" {
  content  = 50 + 10
  filename = "arquivo.txt"
}
