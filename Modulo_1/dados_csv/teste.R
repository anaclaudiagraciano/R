# Esta primeira linha verifica se o pacote readr está instalado. Ele transforma arquivos de texto em txt ou csv
# Caso não esteja, o código abaixo irá prosseguir com a instalação
#if quer dizer se e exclamacao quer dizer nao
if(!require(readr)) install.packages("readr")

# Carregar o pacote readr
library(readr)

# Utilize a função read_csv2 para importar os dados que estao na pasta teste_projeto
# na pasta dados com arquivo covid19
#utilizado header=TRUE por que tem um cabecalho
#sep="," indicando separacao do csv
dados <- read.csv2(file = "dados/covid19.csv", header=TRUE, sep=",")

#save