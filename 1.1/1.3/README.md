# Uso de Módulos

O Terraform permite que você modularize sua infraestrutura, facilitando o reaproveitamento de código. Vamos criar um módulo para criar uma instância EC2 na AWS.

**Explicação**:
- **Módulo EC2**: Criamos um módulo reutilizável para provisionar uma instância EC2.
- **Variáveis**: Definimos variáveis no módulo para que possamos passar valores específicos na instância de uso.
- **Saídas**: Definimos uma saída para retornar o ID da instância provisionada.
- **Main File**: No arquivo principal, usamos o módulo para provisionar a instância EC2 com parâmetros específicos.