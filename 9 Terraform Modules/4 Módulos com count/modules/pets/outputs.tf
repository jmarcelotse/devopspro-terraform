output "name_pet01" {
  #value = random_pet.pet01[0].id // Ajuste se count for utilizado
  value = module.pet[*].name_01
}

output "name_pet02" {
  #value = random_pet.pet02[0].id // Ajuste se count for utilizado
  value = module.pet[*].name_02
}
