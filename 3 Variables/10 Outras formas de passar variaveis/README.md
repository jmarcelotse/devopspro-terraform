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

sh1. Variáveis de ambiente (TF_VAR_<nome_da_variável>)
As variáveis de ambiente têm a mais alta precedência. Você pode definir qualquer variável de entrada do Terraform como uma variável de ambiente usando o prefixo TF_VAR_. Por exemplo, se você tem uma variável chamada instance_type, pode defini-la no ambiente como TF_VAR_instance_type="t2.micro".
terraform apply -var="conteudo_string=' Teste de variavel com passagem por comando" -var=lista_nomes=["Maquina10", Maquina11]'

Ordem de peso de variaveis

#############################################
No Terraform, as variáveis podem ser definidas em vários locais diferentes, e cada local tem uma precedência que determina qual valor será utilizado em caso de conflitos. A ordem de precedência das variáveis no Terraform, da mais alta para a mais baixa, é a seguinte:

1. **Variáveis de ambiente** (`TF_VAR_<nome_da_variável>`)
As variáveis de ambiente têm a mais alta precedência. Você pode definir qualquer variável de entrada do Terraform como uma variável de ambiente usando o prefixo `TF_VAR_`. Por exemplo, se você tem uma variável chamada `instance_type`, pode defini-la no ambiente como `TF_VAR_instance_type="t2.micro"`.

**Exemplo de uso no terminal**:

bash
```
export TF_VAR_instance_type="t2.micro"
```
2. **Flags de linha de comando** (`-var ou -var-file`)
As variáveis passadas diretamente pela linha de comando com a flag `-var` ou por arquivos com a flag `-var-file` substituem as definidas em outros locais (exceto variáveis de ambiente).

**Exemplo de uso com** `-var`:

bash
```
terraform apply -var="instance_type=t2.micro"
```
**Exemplo de uso com** `-var-file`:

bash
```
terraform apply -var-file="prod.tfvars"
```
3. **Arquivos** `.tfvars` **padrão**
Arquivos com o nome padrão, como `terraform.tfvars` ou `terraform.tfvars.json`, ou arquivos especificados no formato `.auto.tfvars`, são carregados automaticamente pelo Terraform. Se existir um arquivo terraform.tfvars, ele será considerado por padrão.

**Exemplo de** `terraform.tfvars`:

hcl
```
instance_type = "t2.micro"
```
Arquivos com a extensão `.auto.tfvars` também são carregados automaticamente.

4. **Valores padrão em arquivos de variável** (`variable`)
Se uma variável for declarada com um valor padrão no código Terraform usando o bloco `variable`, esse valor será usado se nenhum outro valor for especificado em nenhum dos níveis mais altos.

**Exemplo de definição de variável com valor padrão**:

hcl
```
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
```
# Resumo da Ordem de Precedência (da mais alta para a mais baixa):
1. **Variáveis de ambiente** (`TF_VAR_<nome_da_variável>`)
2. **Flags de linha de comando** (`-var ou -var-file`)
3. **Arquivos .tfvars padrão** (`terraform.tfvars, .auto.tfvars`)
4. **Valores padrão em arquivos de variável** (`variable`)
5. **Interatividade (entrada manual)**

Essa ordem garante flexibilidade ao gerenciar as configurações de sua infraestrutura, permitindo que você sobreponha facilmente valores conforme a necessidade, dependendo do ambiente ou da situação.