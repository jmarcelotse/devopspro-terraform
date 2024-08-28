# Utilizando Condicionais em HCL
Este exemplo mostra como aplicar condicionais para criar recursos somente quando uma condição é verdadeira.

**Explicação**:
- **Condicionais**: A variável `create_backup_instance` é usada para decidir se uma instância de backup será criada. Se `true`, a contagem (count) será 1; se `false`, será 0.
- **Count**: O uso de `count` permite que o recurso **aws_instance.backup_server** seja condicionalmente criado.
- **Saídas Condicionais**: Se a instância de backup for criada, seu ID será mostrado na saída backup_server_id.