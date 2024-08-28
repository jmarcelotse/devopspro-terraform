#  Definindo Variáveis e Usando Interpolação
Exemplo simples onde usamos variáveis e interpolação para definir uma instância EC2 na AWS.

**Explicação**:

- **Variáveis**: Definimos variáveis como `region`, `instance_type` e `ami_id` que podem ser facilmente ajustadas para diferentes configurações.
- **Interpolação**: Usamos variáveis em configurações através da interpolação (`var.<variable_name>`).
- **Outputs**: Especificamos saídas que mostram o ID e o IP público da instância EC2 criada.