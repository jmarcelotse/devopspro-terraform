resource "local_file" "exemplo" {
  content  = max(54, 23, 19, 20)
  filename = "arquivo.txt"
}
