resource "local_file" "exemplo" {
  content  = upper(join(", ", ["Docker", "kubernetes", "Prometheus"]))
  filename = "arquivo.txt"
}
