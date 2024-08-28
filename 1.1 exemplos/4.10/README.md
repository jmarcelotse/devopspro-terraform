Vamos organizar a configuração do Terraform fornecida, dividindo-a em vários arquivos e módulos para melhorar a clareza, a modularidade e a manutenção. Veja como você pode estruturar seu projeto:

1. Estrutura do Diretório
bash
Copiar código
project-directory/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── locals.tf
├── data.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── providers.tf

Resumo
Essa estrutura reorganizada do Terraform melhora a modularidade, facilitando o gerenciamento, compreensão e manutenção do código. Também possibilita o reuso de componentes de código em outros projetos ou configurações.