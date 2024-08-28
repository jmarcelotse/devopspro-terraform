# Exemplo de Bloco dynamic
**Explicação**:
- **dynamic "ingress"**: Gera dinamicamente múltiplos blocos ingress dentro do recurso aws_security_group.
- **for_each**: Itera sobre cada item da lista var.ingress_rules para criar as regras de entrada (ingress).