# Configuração de Rede e Banco de Dados na AWS

Agora, um exemplo que envolve a configuração de uma VPC, sub-rede, gateway de internet, e uma instância RDS no AWS.

**Explicação**:
- **VPC e Sub-rede**: Criamos uma VPC e uma sub-rede para a infraestrutura.
- **Gateway de Internet e Rota**: Configuramos um gateway de internet e uma tabela de rotas para permitir tráfego de internet.
- **Instância RDS**: Provisionamos uma instância de banco de dados MySQL com parâmetros básicos de configuração.
- **Grupo de Segurança**: Configuramos um grupo de segurança para restringir o acesso ao banco de dados apenas à sub-rede especificada.