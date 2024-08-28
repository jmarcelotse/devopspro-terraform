# Uso de Condicionais e Expressões
Neste exemplo, vamos criar uma configuração que define um número de instâncias baseado em uma variável de contagem. Além disso, usaremos condicionais para definir atributos opcionais.

**Explicação**:
- **Contagem**: O uso do `count` permite criar múltiplas instâncias. O índice (`count.index`) é utilizado para diferenciar os recursos.
- **Condicionais**: A variável **enable_monitoring** é usada para habilitar ou desabilitar o monitoramento detalhado das instâncias.
- **Saída em Lista**: A saída **instance_ids** utiliza uma sintaxe de lista (`[*]`) para capturar os IDs de todas as instâncias criadas.