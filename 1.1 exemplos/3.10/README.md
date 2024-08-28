# Utilizando for_each para Criar Múltiplos Recursos

Este exemplo demonstra como usar a expressão for_each para criar múltiplos recursos dinamicamente com base em um mapa de valores.

**Explicação**:
- **Mapeamento de Variáveis**: Usamos um mapa para definir diferentes tipos de instância com base no nome ("web" e "db").
- **for_each**: Criamos múltiplas instâncias EC2, uma para cada par no mapa. each.key e each.value são usados para acessar as chaves e valores do mapa.
- **Saída de Lista**: A saída instance_ids coleta os IDs de todas as instâncias criadas.