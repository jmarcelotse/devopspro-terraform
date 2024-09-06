###
1 formar de usar variaveis de ambeintes
sh

export TF_VAR_conteudo_string="Teste de Variavel de ambiente"

export TF_VAR_lista_nomes='["Maquina01", Maquina02"]'

pode usar em pipe para fazer o export antes

####
env (listas as variaveis)

####
outra forma é usar o .tfvars

terraform apply -var-file=./nomedoarquivo.tfvars
###

Passando direto por linha de comando

sh
terraform apply -var="conteudo_string=' Teste de variavel com passagem por comando" -var='lista_nomes=["Maquina10", Maquina11]'