if(!require(readxl)) install.packages("readxl")

library(readxl)

dados_sivep <- read_excel("dados/sifcongenita.xlsx",sheet = 1, skip = 0)

head(dados_sivep)

#sapply(X = dados_sivep, FUN = "typeof")

dados_sivep$EVO_DIAG_N <- factor(
  x = dados_sivep$EVO_DIAG_N,
  levels = c("1", "2", "3", "4", "5"),
  labels = c(
    "sifilis congenita recente",
    "sifilis congenita tardia",
    "aborto",
    "natimorto",
    "descartado"
  )
)

dados_sivep$CS_ESCOL_N <- factor(
  x = dados_sivep$CS_ESCOL_N,
  levels = c("0", "1", "2", "3", "4", "5", "9"),
  labels = c(
    "Sem escolaridade",
    "Fundamental 1º ciclo",
    "Fundamental 2º ciclo",
    "Médio",
    "Superior",
    "Não se aplica",
    "Ignorado"
  ),
  ordered = TRUE
)
                                 
