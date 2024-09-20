module "pet" {
  source          = "./modules/pets"
  prefixo_arquivo = "teste-arquivo-$"
  count           = 4
}
