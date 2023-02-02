if(!require(foreign)) install.packages("foreign");library(foreign)

if(!require(readxl)) install.packages("readxl");library(readxl)

if(!require(readr)) install.packages("readr");library(readr)

if(!require(janitor)) install.packages("janitor");library(janitor)

if(!require(skimr)) install.packages("skimr");library(skimr)

if(!require(stringr)) install.packages("stringr");library(stringr)

if(!require(stringi)) install.packages("stringi");library(stringi)

if(!require(lubridate)) install.packages("lubridate");library(lubridate)

base <- read.dbf("Dados/NINDINET.dbf")

dim(base)

names(base)

if(!require(tidyverse)) install.packages("tidyverse");library(tidyverse)

glimpse(base)

base_menor <- select(base, DT_NOTIFIC, DT_NASC, CS_SEXO, CS_RACA, ID_MN_RESI, ID_AGRAVO)

head(base_menor)

head(select(base, DT_NOTIFIC, DT_NASC, CS_SEXO, CS_RACA, ID_MN_RESI, ID_AGRAVO))

base_menor <- base %>% 
  select(DT_NOTIFIC, DT_NASC, CS_SEXO, CS_RACA, ID_MN_RESI, ID_AGRAVO) %>% 

head()

base_menor

base_menor %>% 
  select(-DT_NASC) %>% 
  
  head()

base_menor_2 <-  base %>% 
  select(NU_NOTIFIC, ID_AGRAVO, DT_NOTIFIC, DT_DIGITA) %>% 
  mutate(TEMPO_DIGITA = DT_DIGITA - DT_NOTIFIC)

base_menor_2 %>%  head()

base_menor_2 %>% 
  mutate(TEMPO_DIGITA = as.numeric(TEMPO_DIGITA)) %>% 
  head()

cid10_categorias <- read.csv2("Dados/CID-10-CATEGORIAS.CSV")

colnames(cid10_categorias)

cid10_categorias_nova <- clean_names(cid10_categorias)

colnames(cid10_categorias_nova)

base_menor_2 %>% 
  filter(ID_AGRAVO == "B19", TEMPO_DIGITA > 7) %>% 
  head()

base_menor_2 %>% 
  filter(ID_AGRAVO == "B19" | ID_AGRAVO == "A279" | ID_AGRAVO == "B54") %>% 
  head(20)

base_menor_2 %>%
  filter(ID_AGRAVO %in% c("B19", "A279", "B54")) %>%
  head(20)

base_menor_2 %>%
  group_by(ID_AGRAVO) %>%
  count(ID_AGRAVO) %>%
  print(n = 20)

base_menor_2 %>%
  group_by(ID_AGRAVO) %>%
  summarise(
    total_agravos = n(),
    media_digita = mean(TEMPO_DIGITA))

base_menor_2 %>% 
  group_by(ID_AGRAVO) %>%
  summarise(total_agravos = n(),
            media_digita = mean(TEMPO_DIGITA)) %>%
  arrange(desc(media_digita))

base %>% 
  summarise(
    total_completo = sum(!is.na(CS_RACA)),
    total_registros = n(),
    total_missing_raca = sum(is.na(CS_RACA)),
    taxa_completude = (total_completo / total_registros) * 100
  )

base %>% 
  summarise(
    total_completo = n_complete(CS_RACA),
    total_na = n_missing(CS_RACA),
    taxa_completude = complete_rate(CS_RACA) * 100
  )

base %>% 
  count(CS_RACA)

base %>% 
  mutate(CS_RACA = replace_na(CS_RACA, replace = 9)) %>% 
  count(CS_RACA)

base %>% 
  mutate(CS_RACA = na_if(CS_RACA, "9")) %>% 
  count(CS_RACA)


