# Uso de Módulos para Reutilização de Código
Vamos criar um módulo para definir uma instância EC2 e depois reutilizá-lo para criar múltiplas instâncias com diferentes configurações.

Estrutura de Diretórios:
css
```
.
├── main.tf
└── modules
    └── ec2_instance
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

**Explicação**:
- **Módulo EC2**: Criamos um módulo que define uma instância EC2, parametrizando-o com variáveis como ami, instance_type, e name.
- **Reutilização do Módulo**: No main.tf, reutilizamos o módulo para criar duas instâncias EC2 com diferentes configurações (web_server e db_server).
- **Outputs**: Exibimos os IDs das instâncias criadas.