# Exemplo de módulo simples
Aqui, o módulo network é referenciado e configurado com os valores necessários. O código para esse módulo ficaria em um diretório chamado modules/network, e poderia incluir várias configurações, como VPC, sub-redes, e roteamento.

Explicação
Módulo de Rede: No main.tf do módulo, é criada uma VPC com uma ou mais subnets públicas, dependendo do número de blocos CIDR fornecidos. As subnets são criadas dinamicamente com base na lista de CIDR fornecida através da variável public_subnets.

Arquivo Principal: No main.tf do diretório raiz, a instância EC2 (aws_instance.web_server) é criada dentro da primeira subnet pública retornada pelo módulo de rede. A variável subnet_id da instância EC2 é definida como a primeira subnet pública disponível (element(module.network.public_subnet_ids, 0)).

Outputs: O módulo de rede exporta os IDs das subnets, permitindo que o arquivo principal use esses valores para alocar recursos dentro da infraestrutura criada pelo módulo.

Essa estrutura modulariza e abstrai a criação de recursos, mantendo o código limpo e reutilizável. O módulo de rede pode ser ajustado ou reutilizado em diferentes partes do projeto sem a necessidade de redefinir a lógica de criação da VPC e das subnets.