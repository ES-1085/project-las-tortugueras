Project Proposal
================
Las Tortugueras
02/11/2023

## Load Packages

``` r
install.packages("tidyverse")
install.packages("skimr")

library(tidyverse)
library(skimr)
```

## 1. Introduction

The aim of this project is to analyze data collected on sea turtles in
Kino Bay, Sonora, Mexico and Buck Island, Saint Croix, USVI. This
project will focus on data collected by Grupo Tortuguero de Bahia de
Kino (GTBK), a community organization that monitors local sea turtle
populations through boat surveys and mark-recapture. We will work
alongside the community organization to answer questions that have come
up during their research. Our aim is to address questions that have been
raised by GTBK and offer them an analysis of their data. We will examine
registration and recapture data including season of registration and
frequency of recapture. We will also incorporate data from the Buck
Island Sea Turtle Research Program (BISTRP) that monitors nesting sea
turtles on an island in the Caribbean. The datasets have individual sea
turtles as the case subject and both research projects have collected
morphometric data on reproductive female Green sea turtles. Using the
overlapping size variables, we will be able to compare the reproductive
female Green turtles in Kino Bay, Mexico to those on Buck Island, USVI.

We will work with three datasets: two from Kino Bay (one from 2014-2018
and one from 2019-present) and one from Buck Island.

The variables are as follows:

“Kino Bay 2014-2018” - `ID#`, `Nombre de la tortuga`,
`No. Monitoreo`,`Estación`, `Fecha Area de Monitoreo`,
`Posicion (Lati. Long.)`, `Hora de capture`, `Especie`, `Peso(Kg)`,
`Sexo`, `L.R.C.(cm)`, `L.C.C.(cm)`, `A.R.C.(cm)`, `A.C.C.(cm)`,
`P.C (cm)`, `L.P (cm)`, `LTC (cm)`, `¿Posee marca? (Recaptura)`,
`Marca Derecha`, `Marca Izquierda`, `Observaciones y comentarios`

“Kino Bay 2019-current” - `Codigo_Comunidad Responsable`, `Red numero`,
`Fecha_inicio`, `Hora_inicio`, `Hora_fin`, `Total_horas`,
`Tipo_monitoreo`, `Metodologia`, `Longitud red / lanceos`,
`Lugar_captura (Latitud, Longitud)`, `Unidad (UTM o grados)`,
`Fecha_captura`, `Hora_captura`, `Nombre tortuga`, `Especie`, `LRC`,
`ARC`, `LCC`, `ACC`, `Profundidad cuerpo`, `Longitud plastron`,
`Longitud total cola`, `Peso_kg`, `Sexo`, `Material_marcas`,
`Marca nueva DX`, `Marca nueva SX`, `Marca previa DX`,
`Marca previa SX`, `PIT tag (si, no)`, `PIT nuevo`, `PIT previo`,
`Muestra sangre (si o no)`, `Muestra piel(si o no)`,
`Muestra cont estom  (si o no)`, `Otra muestra  (si o no)`,
`Especificar`, `Lesiones / Balanos`, `Foto (si o no)`, `Comentarios`,
`ID #`

“Buck Island 2022” - `activity number`, `CDate`, `PrimaryTag`, `sp`,
`ApplyDate`, `Remi?`, `cclnucn`, `ccw`, `cclnuct`, `cclnott`

## 2. Data

``` r
library(readxl)
GTBK_2018_2023 <- read_excel("../data/GTBK_2018_2023.xlsx") 

library(readxl)
GTBK_2014_2018 <- read_excel("../data/GTBK_2014_2018.xls")
```

    ## Warning: Expecting numeric in P148 / R148C16: got a date

    ## Warning: Expecting numeric in R332 / R332C18: got a date

``` r
library(readr)
buis_2022 <- read_csv("../data/buis_greenturtles_2022.csv")
```

#### Data Skim

``` r
skim(GTBK_2018_2023)
```

|                                                  |                |
|:-------------------------------------------------|:---------------|
| Name                                             | GTBK_2018_2023 |
| Number of rows                                   | 471            |
| Number of columns                                | 54             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |                |
| Column type frequency:                           |                |
| character                                        | 49             |
| logical                                          | 3              |
| numeric                                          | 2              |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |                |
| Group variables                                  | None           |

Data summary

**Variable type: character**

| skim_variable                   | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------------------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| Codigo_Comunidad                |         0 |          1.00 |   3 |  12 |     0 |        3 |          0 |
| Responsable                     |         1 |          1.00 |   4 |  43 |     0 |       24 |          0 |
| Red numero                      |         5 |          0.99 |   1 |  10 |     0 |        4 |          0 |
| Fecha_inicio                    |         0 |          1.00 |   5 |  10 |     0 |      111 |          0 |
| Hora_inicio                     |         0 |          1.00 |   5 |  19 |     0 |       36 |          0 |
| Hora_fin                        |         0 |          1.00 |   3 |  19 |     0 |       32 |          0 |
| Total_horas                     |         0 |          1.00 |   1 |  19 |     0 |       36 |          0 |
| Tipo_monitoreo                  |         1 |          1.00 |   4 |   7 |     0 |        2 |          0 |
| Metodologia                     |         1 |          1.00 |   4 |  14 |     0 |        5 |          0 |
| Longitud red / lanceos          |         3 |          0.99 |   1 |   8 |     0 |       10 |          0 |
| Lugar_captura                   |         0 |          1.00 |   9 |  30 |     0 |       33 |          0 |
| Latitud                         |         0 |          1.00 |   7 |  21 |     0 |      133 |          0 |
| Longitud                        |         0 |          1.00 |   7 |  24 |     0 |      131 |          0 |
| Unidad (UTM o grados)           |         0 |          1.00 |   3 |   6 |     0 |        2 |          0 |
| Fecha_captura                   |         1 |          1.00 |   1 |  10 |     0 |      111 |          0 |
| Hora_captura                    |         0 |          1.00 |   1 |  21 |     0 |      271 |          0 |
| Nombre tortuga                  |         0 |          1.00 |   1 |  23 |     0 |      438 |          0 |
| Especie                         |         7 |          0.99 |   5 |  12 |     0 |        4 |          0 |
| 1.LRC                           |         0 |          1.00 |   1 |  26 |     0 |      228 |          0 |
| 2.ARC                           |         0 |          1.00 |   1 |  18 |     0 |      189 |          0 |
| 3.LCC                           |         0 |          1.00 |   1 |  30 |     0 |      187 |          0 |
| 4.ACC                           |         0 |          1.00 |   1 |  18 |     0 |      178 |          0 |
| 5.Profundidad cuerpo            |         0 |          1.00 |   1 |  18 |     0 |      151 |          0 |
| 6\. Longitud plastron           |         0 |          1.00 |   1 |  18 |     0 |      219 |          0 |
| 7\. Longitud total cola         |         0 |          1.00 |   1 |  18 |     0 |       76 |          0 |
| 8\. Peso_kg                     |         0 |          1.00 |   1 |  18 |     0 |       93 |          0 |
| Sexo                            |         7 |          0.99 |   5 |  10 |     0 |        3 |          0 |
| Material_marcas                 |         7 |          0.99 |   5 |   5 |     0 |        2 |          0 |
| Marca nueva DX                  |        75 |          0.84 |   1 |   9 |     0 |      387 |          0 |
| Marca nueva SX                  |        79 |          0.83 |   1 |  30 |     0 |      383 |          0 |
| Marca previa DX                 |       396 |          0.16 |   7 |   8 |     0 |       68 |          0 |
| Marca previa SX                 |       392 |          0.17 |   7 |   8 |     0 |       71 |          0 |
| PIT tag (si, no)                |       469 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Muestra sangre (si o no)…36     |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Muestra piel (si o no)…37       |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Muestra cont estom (si o no)…38 |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Otra muestra (si o no)…39       |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Especificar…40                  |       272 |          0.42 |   7 |  78 |     0 |      145 |          0 |
| Lesiones / Balanos…41           |       232 |          0.51 |  12 |  83 |     0 |      185 |          0 |
| Foto (si o no)…42               |         8 |          0.98 |   2 |   2 |     0 |        5 |          0 |
| Comentarios…43                  |       301 |          0.36 |   1 | 100 |     0 |      130 |          0 |
| Muestra sangre (si o no)…46     |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Muestra piel (si o no)…47       |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Muestra cont estom (si o no)…48 |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Otra muestra (si o no)…49       |       470 |          0.00 |   2 |   2 |     0 |        1 |          0 |
| Especificar…50                  |       272 |          0.42 |   7 |  78 |     0 |      145 |          0 |
| Lesiones / Balanos…51           |       232 |          0.51 |  12 |  83 |     0 |      185 |          0 |
| Foto (si o no)…52               |         8 |          0.98 |   2 |   2 |     0 |        5 |          0 |
| Comentarios…53                  |       301 |          0.36 |   1 | 100 |     0 |      130 |          0 |

**Variable type: logical**

| skim_variable | n_missing | complete_rate | mean | count |
|:--------------|----------:|--------------:|-----:|:------|
| PIT nuevo     |       471 |             0 |  NaN | :     |
| PIT previo…35 |       471 |             0 |  NaN | :     |
| PIT previo…45 |       471 |             0 |  NaN | :     |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate | mean |   sd |  p0 | p25 | p50 | p75 | p100 | hist  |
|:--------------|----------:|--------------:|-----:|-----:|----:|----:|----:|----:|-----:|:------|
| ID \#…44      |        11 |          0.98 | 4.68 | 4.28 |   0 |   2 |   3 |   6 |   25 | ▇▂▁▁▁ |
| ID \#…54      |        11 |          0.98 | 4.68 | 4.28 |   0 |   2 |   3 |   6 |   25 | ▇▂▁▁▁ |

``` r
skim(GTBK_2014_2018)
```

|                                                  |                |
|:-------------------------------------------------|:---------------|
| Name                                             | GTBK_2014_2018 |
| Number of rows                                   | 409            |
| Number of columns                                | 22             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |                |
| Column type frequency:                           |                |
| character                                        | 15             |
| numeric                                          | 7              |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |                |
| Group variables                                  | None           |

Data summary

**Variable type: character**

| skim_variable               | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:----------------------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| ID#                         |         0 |          1.00 |   1 |  13 |     0 |       28 |          0 |
| Nombre de la tortuga        |         0 |          1.00 |   3 |  20 |     0 |      390 |          0 |
| Estacion                    |         5 |          0.99 |   5 |   9 |     0 |        4 |          0 |
| Fecha                       |         1 |          1.00 |   5 |  10 |     0 |      107 |          0 |
| Area de Monitoreo           |         1 |          1.00 |   4 |  35 |     0 |       26 |          0 |
| Posicion (Lati. Long.)      |         6 |          0.99 |   7 |  22 |     0 |      152 |          0 |
| Hora de captura             |         8 |          0.98 |   3 |  20 |     0 |      248 |          0 |
| Especie                     |         1 |          1.00 |  14 |  22 |     0 |        3 |          0 |
| Sexo                        |         1 |          1.00 |   5 |  10 |     0 |        4 |          0 |
| L.R.C. (cm)                 |         2 |          1.00 |   2 |  18 |     0 |      207 |          0 |
| L.P (cm)                    |         5 |          0.99 |   1 |  18 |     0 |      189 |          0 |
| ¿Posee marca? (Recaptura)   |         4 |          0.99 |   2 |   2 |     0 |        2 |          0 |
| Marca Derecha               |         6 |          0.99 |   1 |   8 |     0 |      359 |          0 |
| Marca Izquierda             |         7 |          0.98 |   1 |   8 |     0 |      343 |          0 |
| Observaciones y comentarios |       169 |          0.59 |   1 | 209 |     0 |      207 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |  mean |    sd |    p0 |   p25 |   p50 |   p75 |  p100 | hist  |
|:--------------|----------:|--------------:|------:|------:|------:|------:|------:|------:|------:|:------|
| No. Monitoreo |         1 |          1.00 | 12.35 |  7.53 |  1.00 |  5.00 | 12.00 | 19.00 |  28.0 | ▇▆▆▅▃ |
| Peso (Kg)     |         1 |          1.00 | 39.76 | 15.65 |  4.00 | 31.00 | 38.00 | 46.25 |  96.4 | ▂▇▆▁▁ |
| L.C.C.(cm)    |         1 |          1.00 | 69.93 |  9.76 | 26.00 | 65.50 | 70.15 | 75.03 | 101.5 | ▁▁▇▇▁ |
| A.R.C.(cm)    |         2 |          1.00 | 52.07 |  7.04 | 28.00 | 48.50 | 52.30 | 55.20 |  89.0 | ▁▇▇▁▁ |
| A.C.C.(cm)    |         1 |          1.00 | 66.51 |  9.51 | 24.60 | 62.58 | 67.60 | 71.43 |  91.0 | ▁▁▃▇▁ |
| P.C (cm)      |         6 |          0.99 | 25.71 |  5.34 | 11.00 | 23.00 | 25.30 | 27.50 |  72.6 | ▃▇▁▁▁ |
| LTC (cm)      |         5 |          0.99 | 14.16 |  6.21 |  0.46 | 11.57 | 13.50 | 15.50 |  97.0 | ▇▁▁▁▁ |

``` r
skim(buis_2022)
```

|                                                  |           |
|:-------------------------------------------------|:----------|
| Name                                             | buis_2022 |
| Number of rows                                   | 27        |
| Number of columns                                | 11        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |           |
| Column type frequency:                           |           |
| character                                        | 7         |
| numeric                                          | 4         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |           |
| Group variables                                  | None      |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| activityno    |         0 |          1.00 |   6 |   6 |     0 |       27 |          0 |
| CDate         |         0 |          1.00 |   8 |   9 |     0 |       20 |          0 |
| PrimaryTag    |         0 |          1.00 |   6 |   6 |     0 |       27 |          0 |
| sp            |         0 |          1.00 |   2 |   2 |     0 |        1 |          0 |
| ApplyDate     |         1 |          0.96 |   8 |   9 |     0 |       24 |          0 |
| Remi?         |         0 |          1.00 |   2 |   3 |     0 |        2 |          0 |
| location      |         0 |          1.00 |  11 |  11 |     0 |        1 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |   sd |    p0 |    p25 |   p50 |    p75 |  p100 | hist  |
|:--------------|----------:|--------------:|-------:|-----:|------:|-------:|------:|-------:|------:|:------|
| cclnucn       |         4 |          0.85 | 110.67 | 5.41 | 102.1 | 107.75 | 110.0 | 114.50 | 123.4 | ▅▇▃▂▂ |
| ccw           |         4 |          0.85 | 100.44 | 5.37 |  91.5 |  96.87 |  99.5 | 103.72 | 110.8 | ▃▇▆▃▃ |
| cclnuct       |         4 |          0.85 | 110.69 | 5.60 | 102.1 | 107.75 | 108.7 | 114.55 | 123.4 | ▅▇▂▃▂ |
| cclnott       |         4 |          0.85 |   0.11 | 0.30 |   0.0 |   0.00 |   0.0 |   0.05 |   1.3 | ▇▁▁▁▁ |

## 3. Data Analysis Plan

We are working alongside the community organization Grupo Tortuguero de
Bahia de Kino (GTBK). They are a community-based turtle monitoring group
that collects data from local estuaries and less frequently from local
islands. They are monitoring the health and size of sea turtle
populations, and observing potential recapture. GTBK would like to
visualize the number of sea turtles that have been registered, number
registered per effort hour across all years, frequency of recapture, the
average time between recaptures, and the seasonality of recaptures. The
data we are using has been collected by GTBK from 2014-present in Laguna
la Cruz estuary in Kino Bay, Sonora, Mexico and Isla San Pedro Martir
oceanic offshore island in the Gulf of California.

We would also like to incorporate some of the data that Georgia helped
collect last summer and fall on Buck Island, Saint Croix, USVI. This
data was collected as part of a long term NPS sea turtle monitoring
project called the Buck Island Sea Turtle Research Program (BISTRP).
BISTRP has been monitoring the nesting sea turtles (Greens, Hawksbills)
on Buck Island for 35 years, conducting a mark-recapture study,
collecting biological data and recording the locations of nesting
activities. We are interested in making some sort of comparison between
the reproductive female Green sea turtles (this is one parameter that
both of the datasets have in common) sampled on Buck Island, USVI and
those sampled in Kino Bay, Sonora, Mexico. Because both research
projects collected Curved Carapace Length (CCL) and Curved Carapace
Width (CCW) as size measurements of reproductive female Greens, we would
like to ask how the size of reproductive female GR sea turtles varies
geographically.

For the GTBK data the subject cases are each an individual sea turtle.
The variables we will analyze include date, season, location, tag
numbers, species, and sex.

For the BISTRP data we want to use curved carapace length, curved
carapace width, location, species and primary tag number.

#### Preliminary Analysis

``` r
GTBK_2018_2023 <- GTBK_2018_2023 %>%
  mutate(especie_nombre_latino = 
           case_when(Especie >= "Prieta/Verde" ~ "Chelonia mydas",
                     Especie >= "Carey" ~ "Eretmochelys imbricata", 
                     Especie >= "Amarilla" ~ "Caretta caretta", 
                     Especie >= "Golfina" ~ "Lepidochelys olivacea"))
```

``` r
summary(buis_2022)
```

    ##   activityno           CDate            PrimaryTag             sp           
    ##  Length:27          Length:27          Length:27          Length:27         
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##   ApplyDate            Remi?              cclnucn           ccw        
    ##  Length:27          Length:27          Min.   :102.1   Min.   : 91.50  
    ##  Class :character   Class :character   1st Qu.:107.8   1st Qu.: 96.87  
    ##  Mode  :character   Mode  :character   Median :110.0   Median : 99.50  
    ##                                        Mean   :110.7   Mean   :100.44  
    ##                                        3rd Qu.:114.5   3rd Qu.:103.72  
    ##                                        Max.   :123.4   Max.   :110.80  
    ##                                        NA's   :4       NA's   :4       
    ##     cclnuct         cclnott         location        
    ##  Min.   :102.1   Min.   :0.0000   Length:27         
    ##  1st Qu.:107.8   1st Qu.:0.0000   Class :character  
    ##  Median :108.7   Median :0.0000   Mode  :character  
    ##  Mean   :110.7   Mean   :0.1123                     
    ##  3rd Qu.:114.5   3rd Qu.:0.0500                     
    ##  Max.   :123.4   Max.   :1.3000                     
    ##  NA's   :4       NA's   :4

``` r
summary(GTBK_2014_2018)
```

    ##      ID#            Nombre de la tortuga No. Monitoreo     Estacion        
    ##  Length:409         Length:409           Min.   : 1.00   Length:409        
    ##  Class :character   Class :character     1st Qu.: 5.00   Class :character  
    ##  Mode  :character   Mode  :character     Median :12.00   Mode  :character  
    ##                                          Mean   :12.35                     
    ##                                          3rd Qu.:19.00                     
    ##                                          Max.   :28.00                     
    ##                                          NA's   :1                         
    ##     Fecha           Area de Monitoreo  Posicion (Lati. Long.)
    ##  Length:409         Length:409         Length:409            
    ##  Class :character   Class :character   Class :character      
    ##  Mode  :character   Mode  :character   Mode  :character      
    ##                                                              
    ##                                                              
    ##                                                              
    ##                                                              
    ##  Hora de captura      Especie            Peso (Kg)         Sexo          
    ##  Length:409         Length:409         Min.   : 4.00   Length:409        
    ##  Class :character   Class :character   1st Qu.:31.00   Class :character  
    ##  Mode  :character   Mode  :character   Median :38.00   Mode  :character  
    ##                                        Mean   :39.76                     
    ##                                        3rd Qu.:46.25                     
    ##                                        Max.   :96.40                     
    ##                                        NA's   :1                         
    ##  L.R.C. (cm)          L.C.C.(cm)       A.R.C.(cm)      A.C.C.(cm)   
    ##  Length:409         Min.   : 26.00   Min.   :28.00   Min.   :24.60  
    ##  Class :character   1st Qu.: 65.50   1st Qu.:48.50   1st Qu.:62.58  
    ##  Mode  :character   Median : 70.15   Median :52.30   Median :67.60  
    ##                     Mean   : 69.93   Mean   :52.07   Mean   :66.51  
    ##                     3rd Qu.: 75.03   3rd Qu.:55.20   3rd Qu.:71.42  
    ##                     Max.   :101.50   Max.   :89.00   Max.   :91.00  
    ##                     NA's   :1        NA's   :2       NA's   :1      
    ##     P.C (cm)       L.P (cm)            LTC (cm)       ¿Posee marca? (Recaptura)
    ##  Min.   :11.00   Length:409         Min.   : 0.4597   Length:409               
    ##  1st Qu.:23.00   Class :character   1st Qu.:11.5750   Class :character         
    ##  Median :25.30   Mode  :character   Median :13.5000   Mode  :character         
    ##  Mean   :25.71                      Mean   :14.1591                            
    ##  3rd Qu.:27.50                      3rd Qu.:15.5000                            
    ##  Max.   :72.60                      Max.   :97.0000                            
    ##  NA's   :6                          NA's   :5                                  
    ##  Marca Derecha      Marca Izquierda    Observaciones y comentarios
    ##  Length:409         Length:409         Length:409                 
    ##  Class :character   Class :character   Class :character           
    ##  Mode  :character   Mode  :character   Mode  :character           
    ##                                                                   
    ##                                                                   
    ##                                                                   
    ## 

``` r
summary(GTBK_2018_2023)
```

    ##  Codigo_Comunidad   Responsable         Red numero        Fecha_inicio      
    ##  Length:471         Length:471         Length:471         Length:471        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  Hora_inicio          Hora_fin         Total_horas        Tipo_monitoreo    
    ##  Length:471         Length:471         Length:471         Length:471        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  Metodologia        Longitud red / lanceos Lugar_captura     
    ##  Length:471         Length:471             Length:471        
    ##  Class :character   Class :character       Class :character  
    ##  Mode  :character   Mode  :character       Mode  :character  
    ##                                                              
    ##                                                              
    ##                                                              
    ##                                                              
    ##    Latitud            Longitud         Unidad (UTM o grados) Fecha_captura     
    ##  Length:471         Length:471         Length:471            Length:471        
    ##  Class :character   Class :character   Class :character      Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character      Mode  :character  
    ##                                                                                
    ##                                                                                
    ##                                                                                
    ##                                                                                
    ##  Hora_captura       Nombre tortuga       Especie             1.LRC          
    ##  Length:471         Length:471         Length:471         Length:471        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##     2.ARC              3.LCC              4.ACC           5.Profundidad cuerpo
    ##  Length:471         Length:471         Length:471         Length:471          
    ##  Class :character   Class :character   Class :character   Class :character    
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character    
    ##                                                                               
    ##                                                                               
    ##                                                                               
    ##                                                                               
    ##  6. Longitud plastron 7. Longitud total cola  8. Peso_kg       
    ##  Length:471           Length:471             Length:471        
    ##  Class :character     Class :character       Class :character  
    ##  Mode  :character     Mode  :character       Mode  :character  
    ##                                                                
    ##                                                                
    ##                                                                
    ##                                                                
    ##      Sexo           Material_marcas    Marca nueva DX     Marca nueva SX    
    ##  Length:471         Length:471         Length:471         Length:471        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  Marca previa DX    Marca previa SX    PIT tag (si, no)   PIT nuevo     
    ##  Length:471         Length:471         Length:471         Mode:logical  
    ##  Class :character   Class :character   Class :character   NA's:471      
    ##  Mode  :character   Mode  :character   Mode  :character                 
    ##                                                                         
    ##                                                                         
    ##                                                                         
    ##                                                                         
    ##  PIT previo...35 Muestra sangre (si o no)...36 Muestra piel  (si o no)...37
    ##  Mode:logical    Length:471                    Length:471                  
    ##  NA's:471        Class :character              Class :character            
    ##                  Mode  :character              Mode  :character            
    ##                                                                            
    ##                                                                            
    ##                                                                            
    ##                                                                            
    ##  Muestra cont estom  (si o no)...38 Otra muestra  (si o no)...39
    ##  Length:471                         Length:471                  
    ##  Class :character                   Class :character            
    ##  Mode  :character                   Mode  :character            
    ##                                                                 
    ##                                                                 
    ##                                                                 
    ##                                                                 
    ##  Especificar...40   Lesiones / Balanos...41 Foto (si o no)...42
    ##  Length:471         Length:471              Length:471         
    ##  Class :character   Class :character        Class :character   
    ##  Mode  :character   Mode  :character        Mode  :character   
    ##                                                                
    ##                                                                
    ##                                                                
    ##                                                                
    ##  Comentarios...43     ID #...44      PIT previo...45
    ##  Length:471         Min.   : 0.000   Mode:logical   
    ##  Class :character   1st Qu.: 2.000   NA's:471       
    ##  Mode  :character   Median : 3.000                  
    ##                     Mean   : 4.683                  
    ##                     3rd Qu.: 6.000                  
    ##                     Max.   :25.000                  
    ##                     NA's   :11                      
    ##  Muestra sangre (si o no)...46 Muestra piel  (si o no)...47
    ##  Length:471                    Length:471                  
    ##  Class :character              Class :character            
    ##  Mode  :character              Mode  :character            
    ##                                                            
    ##                                                            
    ##                                                            
    ##                                                            
    ##  Muestra cont estom  (si o no)...48 Otra muestra  (si o no)...49
    ##  Length:471                         Length:471                  
    ##  Class :character                   Class :character            
    ##  Mode  :character                   Mode  :character            
    ##                                                                 
    ##                                                                 
    ##                                                                 
    ##                                                                 
    ##  Especificar...50   Lesiones / Balanos...51 Foto (si o no)...52
    ##  Length:471         Length:471              Length:471         
    ##  Class :character   Class :character        Class :character   
    ##  Mode  :character   Mode  :character        Mode  :character   
    ##                                                                
    ##                                                                
    ##                                                                
    ##                                                                
    ##  Comentarios...53     ID #...54      especie_nombre_latino
    ##  Length:471         Min.   : 0.000   Length:471           
    ##  Class :character   1st Qu.: 2.000   Class :character     
    ##  Mode  :character   Median : 3.000   Mode  :character     
    ##                     Mean   : 4.683                        
    ##                     3rd Qu.: 6.000                        
    ##                     Max.   :25.000                        
    ##                     NA's   :11

``` r
GTBK_2014_2018 %>%
  count(Especie, sort = TRUE)
```

    ## # A tibble: 4 × 2
    ##   Especie                    n
    ##   <chr>                  <int>
    ## 1 Chelonia mydas           395
    ## 2 Lepidochelys olivacea      8
    ## 3 Eretmochelys imbricata     5
    ## 4 <NA>                       1

``` r
GTBK_2018_2023 %>%
  count(especie_nombre_latino, sort = TRUE)
```

    ## # A tibble: 4 × 2
    ##   especie_nombre_latino      n
    ##   <chr>                  <int>
    ## 1 Chelonia mydas           453
    ## 2 Eretmochelys imbricata     9
    ## 3 <NA>                       7
    ## 4 Caretta caretta            2

``` r
buis_2022 %>%
  count(sp, sort = TRUE)
```

    ## # A tibble: 1 × 2
    ##   sp        n
    ##   <chr> <int>
    ## 1 GR       27

## Visualizations

Brainstorming: Some visualizations that could be helpful for our data
analysis include line graphs or a time series that maps the number of
recaptures by GTBK over time (maybe using some sort of time-based
animation). One visualization that we could create would display the
number of recaptures by GTBK per species faceted by seasonality. For the
visualization comparing the size of reproductive female GR turtles, we
could use a pair of violin plots or box plots to display the
distribution of individual sizes in each geographic region.

- A bar graph or line graph (or combo) displaying turtles per effort
  hour over year
- A bar graph (sideways) displaying number of turtles that have been
  recaptured 2, 3, 4, 5, etc. times
- Spatial color-coded points for turtles that have been recaptured more
  than once (site fidelity visualization) in locations
- Number of turtles recaptured every year, number recaptured every two
  years, number recaptured every three years, etc.
- A horizontal bar graph displaying Average number of turtle recaptures
  over month
- Bar graphs of number of recaptures over month faceted by individual
  turtles (2 sets of this for San Pedro Martí and the estuary)
