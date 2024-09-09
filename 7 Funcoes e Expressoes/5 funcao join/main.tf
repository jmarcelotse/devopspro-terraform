resource "local_file" "exemplo" {
  content  = join(", ", ["Docker", "kubernetes", "Prometheus"])
  filename = "arquivo.txt"
}
