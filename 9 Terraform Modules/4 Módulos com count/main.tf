module "pet" {
  source          = "./modules/pets"
  prefixo_arquivo = "teste-arquivo-${count.index}"
  num_instancias  = 4 # Adicione esta linha para passar a variável
  count           = 4
}
