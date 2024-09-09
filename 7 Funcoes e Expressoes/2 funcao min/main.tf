resource "local_file" "exemplo" {
  content  = min(54, 23, 19, 20)
  filename = "arquivo.txt"
}
