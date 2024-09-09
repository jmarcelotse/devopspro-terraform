resource "local_file" "exemplo" {
  content  = endswith("Hello World", "Hello")
  filename = "arquivo.txt"
}
