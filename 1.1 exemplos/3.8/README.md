# Criação de Rede com VPC e Sub-redes
Neste exemplo, vamos criar uma VPC com duas sub-redes públicas na AWS.

**Explicação**:

- **VPC e Sub-redes**: Criamos uma VPC (`aws_vpc`) e duas sub-redes (`aws_subnet`) dentro dela.
- **Gateway de Internet**: Um `aws_internet_gateway` é criado e associado à VPC.
- **Tabela de Roteamento**: A `aws_route_table` define rotas para a Internet, e as associações (`aws_route_table_association`) ligam a tabela de rotas às sub-redes.