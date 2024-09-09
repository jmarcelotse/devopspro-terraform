resource "local_file" "exemplo" {
  content  = lower(join(", ", ["Docker", "kubernetes", "Prometheus"]))
  filename = "arquivo.txt"
}
