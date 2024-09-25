variable "prefixo_arquivo" {
  type        = string
  description = "Prefixo a ser usado nos nomes dos arquivos gerados"
}

variable "num_instancias" { # Renomeado de count para num_instancias
  type        = number
  description = "Número de instâncias a serem criadas"
}
