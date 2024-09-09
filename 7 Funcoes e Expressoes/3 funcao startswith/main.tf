resource "local_file" "exemplo" {
  content  = startswith("Hello World", "Hello")
  filename = "arquivo.txt"
}
