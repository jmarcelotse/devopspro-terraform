resource "random_pet" "pet01" {
  count = var.num_instancias
}

resource "random_pet" "pet02" {
  count = var.num_instancias
}

resource "local_file" "arquivo" {
  count    = var.num_instancias
  content  = random_pet.pet01[count.index].id
  filename = "${var.prefixo_arquivo}-arquivo-${count.index}.txt"
}

resource "local_file" "outro_arquivo" {
  count    = var.num_instancias
  content  = random_pet.pet02[count.index].id
  filename = "${var.prefixo_arquivo}-outro_arquivo-${count.index}.txt"
}
