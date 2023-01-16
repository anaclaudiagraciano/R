# Esta primeira linha verifica se o pacote está instalado.
# Caso não esteja, o código abaixo irá prosseguir com a instalação do 
if(!require(readr)) install.packages("readr")

#Carregando o pacote readr
library(readr)

# Utilize a função read_csv2 para importar os dados 
# do arquivo e_sus_notifica.csv para um objeto chamado "dados"
dados <- read_csv2(file = "Dados/e_sus_notifica.csv")
