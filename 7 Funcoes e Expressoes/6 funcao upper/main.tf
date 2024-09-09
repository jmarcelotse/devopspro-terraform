resource "local_file" "exemplo" {
  content  = upper("Docker, kubernetes, Prometheus")
  filename = "arquivo.txt"
}
