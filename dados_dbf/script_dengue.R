if(!require(foreign)) install.packages("foreign")

library(foreign)

dados_sinan <- read.dbf("dados/dengue.dbf", as.is = TRUE)

head(dados_sinan)


