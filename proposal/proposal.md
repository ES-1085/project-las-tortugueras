Project proposal
================
Las Tortugueras

``` r
# install.packages(tidyverse)
# install.packages(skimr)

library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.4.0     ✔ purrr   1.0.1
    ## ✔ tibble  3.1.8     ✔ dplyr   1.1.0
    ## ✔ tidyr   1.3.0     ✔ stringr 1.5.0
    ## ✔ readr   2.1.3     ✔ forcats 1.0.0
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(skimr)
```

## 1. Introduction

The aim of this project is to analyze data collected on sea turtles in
Kino Bay, Sonora, Mexico and Buck Island, Saint Croix, USVI. This
project will focus on data collected by Grupo Tortuguero de Bahia de
Kino (GTBK), a community organization that monitors sea turtle
populations and recapture. We will work alongside the community
organization to answer questions that have come up during their
research. Our aim is to address questions that have been raised by GTBK
and offer them an analysis of their data. We will examine registration
and recapture data including season of registration and frequency of
recapture. We will also incorporate data from the Buck Island Sea Turtle
Research Program (BISTRP) that monitors nesting sea turtles. Both
datasets have individual sea turtles as the case subject; the two
datasets each have data on reproductive females, we will be able to
compare the two locations using this variable. We will work with three
datasets: two from Kino Bay–one from 2014-2018 and one from
2019-current–and one from Buck’s Island. The variables are as follows:
Kino Bay 2014-2018–ID#, Nombre de la tortuga, No. Monitoreo, Estación,
Fecha Area de Monitoreo, Posicion (Lati. Long.), Hora de capture,
Especie, Peso (Kg), Sexo, L.R.C. (cm), L.C.C.(cm), A.R.C.(cm),
A.C.C.(cm), P.C (cm), L.P (cm), LTC (cm), ¿Posee marca? (Recaptura),
Marca Derecha, Marca Izquierda, Observaciones y comentarios. Kino Bay
2019-current–Codigo_Comunidad Responsable, Red numero, Fecha_inicio,
Hora_inicio, Hora_fin, Total_horas, Tipo_monitoreo, Metodologia,
Longitud red / lanceos, Lugar_captura (Latitud, Longitud), Unidad (UTM o
grados), Fecha_captura, Hora_captura, Nombre tortuga, Especie, LRC, ARC,
LCC, ACC, Profundidad cuerpo, Longitud plastron, Longitud total cola,
Peso_kg, Sexo, Material_marcas, Marca nueva DX, Marca nueva SX, Marca
previa DX, Marca previa SX, PIT tag (si, no), PIT nuevo, PIT previo ,
Muestra sangre (si o no), Muestra piel (si o no), Muestra cont estom (si
o no), Otra muestra (si o no), Especificar, Lesiones / Balanos, Foto (si
o no), Comentarios, ID \#, PIT previo, Muestra sangre (si o no), Muestra
piel (si o no), Muestra cont estom (si o no), Otra muestra (si o no),
Especificar Lesiones / Balanos, Foto (si o no), Comentarios, ID \# Bucks
Island–activity number : unique numerical identifier representing each
nesting activity from 2022, CDate : date that the sea turtle was
measured in 2022, PrimaryTag : “name” of the turtle (the first tag that
she was ever given), sp : species, ApplyDate : date that the turtle was
given her primary tag, Remi? : (TRUE/FALSE) indicates whether the turtle
had been recaptured before 2022, cclnucn : curved carapace length from
nuchal notch to notch, ccw : curved carapace width, cclnuct : curved
carapace length from nuchal notch to tip, cclnott : curved carapace
length from notch to tip.

## 2. Data

``` r
library(readxl)
GTBK_2018_2023 <- read_excel("../data/GTBK_2018_2023.xlsx") 
```

    ## New names:
    ## • `PIT previo` -> `PIT previo...35`
    ## • `Muestra sangre (si o no)` -> `Muestra sangre (si o no)...36`
    ## • `Muestra piel (si o no)` -> `Muestra piel (si o no)...37`
    ## • `Muestra cont estom (si o no)` -> `Muestra cont estom (si o no)...38`
    ## • `Otra muestra (si o no)` -> `Otra muestra (si o no)...39`
    ## • `Especificar` -> `Especificar...40`
    ## • `Lesiones / Balanos` -> `Lesiones / Balanos...41`
    ## • `Foto (si o no)` -> `Foto (si o no)...42`
    ## • `Comentarios` -> `Comentarios...43`
    ## • `ID #` -> `ID #...44`
    ## • `PIT previo` -> `PIT previo...45`
    ## • `Muestra sangre (si o no)` -> `Muestra sangre (si o no)...46`
    ## • `Muestra piel (si o no)` -> `Muestra piel (si o no)...47`
    ## • `Muestra cont estom (si o no)` -> `Muestra cont estom (si o no)...48`
    ## • `Otra muestra (si o no)` -> `Otra muestra (si o no)...49`
    ## • `Especificar` -> `Especificar...50`
    ## • `Lesiones / Balanos` -> `Lesiones / Balanos...51`
    ## • `Foto (si o no)` -> `Foto (si o no)...52`
    ## • `Comentarios` -> `Comentarios...53`
    ## • `ID #` -> `ID #...54`

``` r
library(readxl)
GTBK_2014_2018 <- read_excel("../data/GTBK_2014_2018.xls")
```

    ## Warning: Expecting numeric in P148 / R148C16: got a date

    ## Warning: Expecting numeric in R332 / R332C18: got a date

``` r
library(readr)
buis_greenturtles_2022 <- read_csv("../data/buis_greenturtles_2022.csv")
```

    ## Rows: 27 Columns: 11
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (7): activityno, CDate, PrimaryTag, sp, ApplyDate, Remi?, location
    ## dbl (4): cclnucn, ccw, cclnuct, cclnott
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

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
skim(buis_greenturtles_2022)
```

|                                                  |                        |
|:-------------------------------------------------|:-----------------------|
| Name                                             | buis_greenturtles_2022 |
| Number of rows                                   | 27                     |
| Number of columns                                | 11                     |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |                        |
| Column type frequency:                           |                        |
| character                                        | 7                      |
| numeric                                          | 4                      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |                        |
| Group variables                                  | None                   |

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

## 3. Data analysis plan

We are working alongside the community organization Grupo Tortuguero de
Bahia de Kino (GTBK). They are a community-based turtle monitoring group
that collects data from local estuaries and less frequently local
islands. They are monitoring populations health and size, and observing
potential recapture. GTBK would like to visualize the number of sea
turtles that have been registered, number registered per effort hour
across all years, frequency of recapture, the average time between
recaptures, and the seasonality of recaptures. The data we are using has
been collected by GTBK from 2014-present in Laguna la Cruz estuary in
Kino Bay, Sonora, Mexico and Isla San Pedro Martir oceanic offshore
island in the Gulf of California.

We would also like to incorporate some of the data that Georgia helped
collect last summer and fall on Buck Island, Saint Croix, USVI. This
data was collected as part of a long term NPS sea turtle monitoring
project called the Buck Island Sea Turtle Research Program (BISTRP).
BISTRP has been monitoring the nesting sea turtles (Greens, Hawksbills)
on Buck Island for 35 years, conducting a mark-recapture study,
collecting biological data and recording the locations of nesting
activities. We are interested in making some sort of comparison between
the reproductive female Green sea turtles (this is one parameter that
both of our datasets have in common) sampled on Buck Island, USVI and
those sampled in Kino Bay, Sonora, Mexico. Because both research
projects collected Curved Carapace Length (CCL) as a size measurement of
reproductive female Greens, we would like to ask how the size of
reproductive female GR sea turtles varies geographically.

For the GTBK data the subject cases are each an individual sea turtle.
The variables we will analyze include date, season, location, tag
numbers, species, and sex.

For the BISTRP data we want to use carapace size and primary tag number.

#### Preliminary Analysis

``` r
GTBK_2018_2023 <- GTBK_2018_2023 %>%
  mutate(especie_nombre_latino = 
           case_when(Especie >= "Prieta/Verde" ~ "Chelonia mydas",
                     Especie >= "Carey" ~ "Eretmochelys imbricata", 
                     Especie >= "Amarilla" ~ "Caretta caretta", 
                     Especie >= "Golfina" ~ "Lepidochelys olivacea"))
```
