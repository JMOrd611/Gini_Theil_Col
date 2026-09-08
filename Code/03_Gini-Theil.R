# =====================================================================
# 03_Gini-Theil.R
# Código para crear los índices en R.
# Requiere haber ejecutado antes Code/01_GEIH.do
#
# Abrir mediante el archivo .Rproj de la raiz del repositorio.
# No usar setwd(): el proyecto fija el directorio de trabajo.
#
# Fuente: Departamento Administrativo Nacional de Estadistica:
# www.dane.gov.co
# =====================================================================

library(DescTools)
library(haven)
library(openxlsx)
library(concstats)
library(dplyr)
library(ineq)
Total <- read_dta("Output/Total.DTA")
Total <- Total %>% filter(!is.na(INGLABO)) ## Base Dic. 2018
## AÑOS (Gini-Theil)############################################ 
### 2020
GinThe20 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinThe20 <- filter(GinThe20,Ano=="2020")
GinThe20 <- GinThe20[order(GinThe20$INGLABO), ]

Gini20 <- Gini(GinThe20$INGLABO)

A20p40  <- quantile(GinThe20$INGLABO, 0.40)
A20p90  <- quantile(GinThe20$INGLABO, 0.90)

Ing4020 = sum(GinThe20$INGLABO[GinThe20$INGLABO <= A20p40])
Ing1020 = sum(GinThe20$INGLABO[GinThe20$INGLABO >= A20p90])
Palma20 = Ing1020/Ing4020

Atk20 = Atkinson(GinThe20$INGLABO, paramete = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

GinThe20 <- GinThe20 %>%
  mutate(
    ZlnZn = (INGLABO / sum(INGLABO)) * log((INGLABO / sum(INGLABO)) * n()),
    YiY = INGLABO/mean(INGLABO),
    The = YiY * log(YiY)
    )
GinThe20 <- GinThe20 %>%
  group_by(DPTO) %>%
  mutate(
    Zij = INGLABO / sum(INGLABO),
    nij = n(),
    ZijlZijn = Zij * log(Zij*nij)
  ) %>%
  ungroup()
TheInEn20 = GinThe20 %>%
  group_by(DPTO) %>%
  summarise(
    Vj = sum(INGLABO) / sum(GinThe20$INGLABO),
    ZlnZn = sum(ZijlZijn, na.rm = TRUE)
  ) %>%
  ungroup()
Cont20 <- GinThe20 %>%
  summarise(
    N = n(),  
    .by = DPTO
  )
TheInEn20 <- TheInEn20 %>%
  left_join(Cont20, by = c("DPTO" = "DPTO"))
TheInEn20 <- TheInEn20 %>%
  mutate(
    VjNnj = Vj * (sum(N) / N)
  )
TheInEn20 <- TheInEn20 %>%
  mutate(
    VjLnvNn = Vj * log(VjNnj),
    VZlnZ = Vj * ZlnZn
  )
InterThe20 = sum(TheInEn20$VjLnvNn)
IntraThe20 = sum(TheInEn20$VZlnZ)
The20 = InterThe20 + IntraThe20

### 2021
GinThe21 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinThe21 <- filter(GinThe21,Ano=="2021")
GinThe21 <- GinThe21[order(GinThe21$INGLABO), ]

Gini21 <- Gini(GinThe21$INGLABO)

A21p40  <- quantile(GinThe21$INGLABO, 0.40)
A21p90  <- quantile(GinThe21$INGLABO, 0.90)

Ing4021 = sum(GinThe21$INGLABO[GinThe21$INGLABO <= A21p40])
Ing1021 = sum(GinThe21$INGLABO[GinThe21$INGLABO >= A21p90])
Palma21 = Ing1021/Ing4021

Atk21 = Atkinson(GinThe21$INGLABO, paramete = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

GinThe21 <- GinThe21 %>%
  mutate(
    ZlnZn = (INGLABO / sum(INGLABO)) * log((INGLABO / sum(INGLABO)) * n()),
    YiY = INGLABO/mean(INGLABO),
    The = YiY * log(YiY)
  )
GinThe21 <- GinThe21 %>%
  group_by(DPTO) %>%
  mutate(
    Zij = INGLABO / sum(INGLABO),
    nij = n(),
    ZijlZijn = Zij * log(Zij*nij)
  ) %>%
  ungroup()
TheInEn21 = GinThe21 %>%
  group_by(DPTO) %>%
  summarise(
    Vj = sum(INGLABO) / sum(GinThe21$INGLABO),
    ZlnZn = sum(ZijlZijn, na.rm = TRUE)
  ) %>%
  ungroup()
Cont21 <- GinThe21 %>%
  summarise(
    N = n(),  
    .by = DPTO
  )
TheInEn21 <- TheInEn21 %>%
  left_join(Cont21, by = c("DPTO" = "DPTO"))
TheInEn21 <- TheInEn21 %>%
  mutate(
    VjNnj = Vj * (sum(N) / N)
  )
TheInEn21 <- TheInEn21 %>%
  mutate(
    VjLnvNn = Vj * log(VjNnj),
    VZlnZ = Vj * ZlnZn
  )
InterThe21 = sum(TheInEn21$VjLnvNn)
IntraThe21 = sum(TheInEn21$VZlnZ)
The21 = InterThe21 + IntraThe21

### 2022
GinThe22 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinThe22 <- filter(GinThe22,Ano=="2022")
GinThe22 <- GinThe22[order(GinThe22$INGLABO), ]

Gini22 <- Gini(GinThe22$INGLABO)

A22p40  <- quantile(GinThe22$INGLABO, 0.40)
A22p90  <- quantile(GinThe22$INGLABO, 0.90)

Ing4022 = sum(GinThe22$INGLABO[GinThe22$INGLABO <= A22p40])
Ing1022 = sum(GinThe22$INGLABO[GinThe22$INGLABO >= A22p90])
Palma22 = Ing1022/Ing4022

Atk22 = Atkinson(GinThe22$INGLABO, paramete = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

GinThe22 <- GinThe22 %>%
  mutate(
    ZlnZn = (INGLABO / sum(INGLABO)) * log((INGLABO / sum(INGLABO)) * n()),
    YiY = INGLABO/mean(INGLABO),
    The = YiY * log(YiY)
  )
GinThe22 <- GinThe22 %>%
  group_by(DPTO) %>%
  mutate(
    Zij = INGLABO / sum(INGLABO),
    nij = n(),
    ZijlZijn = Zij * log(Zij*nij)
  ) %>%
  ungroup()
TheInEn22 = GinThe22 %>%
  group_by(DPTO) %>%
  summarise(
    Vj = sum(INGLABO) / sum(GinThe22$INGLABO),
    ZlnZn = sum(ZijlZijn, na.rm = TRUE)
  ) %>%
  ungroup()
Cont22 <- GinThe22 %>%
  summarise(
    N = n(),  
    .by = DPTO
  )
TheInEn22 <- TheInEn22 %>%
  left_join(Cont22, by = c("DPTO" = "DPTO"))
TheInEn22 <- TheInEn22 %>%
  mutate(
    VjNnj = Vj * (sum(N) / N)
  )
TheInEn22 <- TheInEn22 %>%
  mutate(
    VjLnvNn = Vj * log(VjNnj),
    VZlnZ = Vj * ZlnZn
  )
InterThe22 = sum(TheInEn22$VjLnvNn)
IntraThe22 = sum(TheInEn22$VZlnZ)
The22 = InterThe22 + IntraThe22

### 2023
GinThe23 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinThe23 <- filter(GinThe23,Ano=="2023")
GinThe23 <- GinThe23[order(GinThe23$INGLABO), ]

Gini23 <- Gini(GinThe23$INGLABO)

A23p40  <- quantile(GinThe23$INGLABO, 0.40)
A23p90  <- quantile(GinThe23$INGLABO, 0.90)

Ing4023 = sum(GinThe23$INGLABO[GinThe23$INGLABO <= A23p40])
Ing1023 = sum(GinThe23$INGLABO[GinThe23$INGLABO >= A23p90])
Palma23 = Ing1023/Ing4023

Atk23 = Atkinson(GinThe23$INGLABO, paramete = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

GinThe23 <- GinThe23 %>%
  mutate(
    ZlnZn = (INGLABO / sum(INGLABO)) * log((INGLABO / sum(INGLABO)) * n()),
    YiY = INGLABO/mean(INGLABO),
    The = YiY * log(YiY)
  )
GinThe23 <- GinThe23 %>%
  group_by(DPTO) %>%
  mutate(
    Zij = INGLABO / sum(INGLABO),
    nij = n(),
    ZijlZijn = Zij * log(Zij*nij)
  ) %>%
  ungroup()
TheInEn23 = GinThe23 %>%
  group_by(DPTO) %>%
  summarise(
    Vj = sum(INGLABO) / sum(GinThe23$INGLABO),
    ZlnZn = sum(ZijlZijn, na.rm = TRUE)
  ) %>%
  ungroup()
Cont23 <- GinThe23 %>%
  summarise(
    N = n(),  
    .by = DPTO
  )
TheInEn23 <- TheInEn23 %>%
  left_join(Cont23, by = c("DPTO" = "DPTO"))
TheInEn23 <- TheInEn23 %>%
  mutate(
    VjNnj = Vj * (sum(N) / N)
  )
TheInEn23 <- TheInEn23 %>%
  mutate(
    VjLnvNn = Vj * log(VjNnj),
    VZlnZ = Vj * ZlnZn
  )
InterThe23 = sum(TheInEn23$VjLnvNn)
IntraThe23 = sum(TheInEn23$VZlnZ)
The23 = InterThe23 + IntraThe23

### 2024
GinThe24 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinThe24 <- filter(GinThe24,Ano=="2024")
GinThe24 <- GinThe24[order(GinThe24$INGLABO), ]

Gini24 <- Gini(GinThe24$INGLABO)

A24p40  <- quantile(GinThe24$INGLABO, 0.40)
A24p90  <- quantile(GinThe24$INGLABO, 0.90)

Ing4024 = sum(GinThe24$INGLABO[GinThe24$INGLABO <= A24p40])
Ing1024 = sum(GinThe24$INGLABO[GinThe24$INGLABO >= A24p90])
Palma24 = Ing1024/Ing4024

Atk24 = Atkinson(GinThe24$INGLABO, paramete = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

GinThe24 <- GinThe24 %>%
  mutate(
    ZlnZn = (INGLABO / sum(INGLABO)) * log((INGLABO / sum(INGLABO)) * n()),
    YiY = INGLABO/mean(INGLABO),
    The = YiY * log(YiY)
  )
GinThe24 <- GinThe24 %>%
  group_by(DPTO) %>%
  mutate(
    Zij = INGLABO / sum(INGLABO),
    nij = n(),
    ZijlZijn = Zij * log(Zij*nij)
  ) %>%
  ungroup()
TheInEn24 = GinThe24 %>%
  group_by(DPTO) %>%
  summarise(
    Vj = sum(INGLABO) / sum(GinThe24$INGLABO),
    ZlnZn = sum(ZijlZijn, na.rm = TRUE)
  ) %>%
  ungroup()
Cont24 <- GinThe24 %>%
  summarise(
    N = n(),  
    .by = DPTO
  )
TheInEn24 <- TheInEn24 %>%
  left_join(Cont24, by = c("DPTO" = "DPTO"))
TheInEn24 <- TheInEn24 %>%
  mutate(
    VjNnj = Vj * (sum(N) / N)
  )
TheInEn24 <- TheInEn24 %>%
  mutate(
    VjLnvNn = Vj * log(VjNnj),
    VZlnZ = Vj * ZlnZn
  )
InterThe24 = sum(TheInEn24$VjLnvNn)
IntraThe24 = sum(TheInEn24$VZlnZ)
The24 = InterThe24 + IntraThe24

#### Departamentos############################################
##### 05 -> Antioquia
GinTheD05 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD05 <- filter(GinTheD05,DPTO=="5")

GiniD05 <- Gini(GinTheD05$INGLABO)

D05p40  <- quantile(GinTheD05$INGLABO, 0.40)
D05p90  <- quantile(GinTheD05$INGLABO, 0.90)

Ing40D05 = sum(GinTheD05$INGLABO[GinTheD05$INGLABO <= D05p40])
Ing10D05 = sum(GinTheD05$INGLABO[GinTheD05$INGLABO >= D05p90])
PalmaD05 = Ing10D05/Ing40D05

AtkD05 = Atkinson(GinTheD05$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD05 = Theil(GinTheD05$INGLABO, parameter = 0)

##### 08 -> Atlantico
GinTheD08 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD08 <- filter(GinTheD08,DPTO=="8")

GiniD08 <- Gini(GinTheD08$INGLABO)

D08p40  <- quantile(GinTheD08$INGLABO, 0.40)
D08p90  <- quantile(GinTheD08$INGLABO, 0.90)

Ing40D08 = sum(GinTheD08$INGLABO[GinTheD08$INGLABO <= D08p40])
Ing10D08 = sum(GinTheD08$INGLABO[GinTheD08$INGLABO >= D08p90])
PalmaD08 = Ing10D08/Ing40D08

AtkD08 = Atkinson(GinTheD08$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD08 = Theil(GinTheD08$INGLABO, parameter = 0)

##### 11 -> Bogotá
GinTheD11 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD11 <- filter(GinTheD11,DPTO=="11")

GiniD11 <- Gini(GinTheD11$INGLABO)

D11p40  <- quantile(GinTheD11$INGLABO, 0.40)
D11p90  <- quantile(GinTheD11$INGLABO, 0.90)

Ing40D11 = sum(GinTheD11$INGLABO[GinTheD11$INGLABO <= D11p40])
Ing10D11 = sum(GinTheD11$INGLABO[GinTheD11$INGLABO >= D11p90])
PalmaD11 = Ing10D11/Ing40D11

AtkD11 = Atkinson(GinTheD11$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD11 = Theil(GinTheD11$INGLABO, parameter = 0)

##### 13 -> Bolivar
GinTheD13 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD13 <- filter(GinTheD13,DPTO=="13")

GiniD13 <- Gini(GinTheD13$INGLABO)

D13p40  <- quantile(GinTheD13$INGLABO, 0.40)
D13p90  <- quantile(GinTheD13$INGLABO, 0.90)

Ing40D13 = sum(GinTheD13$INGLABO[GinTheD13$INGLABO <= D13p40])
Ing10D13 = sum(GinTheD13$INGLABO[GinTheD13$INGLABO >= D13p90])
PalmaD13 = Ing10D13/Ing40D13

AtkD13 = Atkinson(GinTheD13$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD13 = Theil(GinTheD13$INGLABO, parameter = 0)

##### 15 -> Boyacá
GinTheD15 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD15 <- filter(GinTheD15,DPTO=="15")

GiniD15 <- Gini(GinTheD15$INGLABO)

D15p40  <- quantile(GinTheD15$INGLABO, 0.40)
D15p90  <- quantile(GinTheD15$INGLABO, 0.90)

Ing40D15 = sum(GinTheD15$INGLABO[GinTheD15$INGLABO <= D15p40])
Ing10D15 = sum(GinTheD15$INGLABO[GinTheD15$INGLABO >= D15p90])
PalmaD15 = Ing10D15/Ing40D15

AtkD15 = Atkinson(GinTheD15$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD15 = Theil(GinTheD15$INGLABO, parameter = 0)

##### 17 -> Caldas
GinTheD17 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD17 <- filter(GinTheD17,DPTO=="17")

GiniD17 <- Gini(GinTheD17$INGLABO)

D17p40  <- quantile(GinTheD17$INGLABO, 0.40)
D17p90  <- quantile(GinTheD17$INGLABO, 0.90)

Ing40D17 = sum(GinTheD17$INGLABO[GinTheD17$INGLABO <= D17p40])
Ing10D17 = sum(GinTheD17$INGLABO[GinTheD17$INGLABO >= D17p90])
PalmaD17 = Ing10D17/Ing40D17

AtkD17 = Atkinson(GinTheD17$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD17 = Theil(GinTheD17$INGLABO, parameter = 0)

##### 18 -> Caquetá
GinTheD18 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD18 <- filter(GinTheD18,DPTO=="18")

GiniD18 <- Gini(GinTheD18$INGLABO)

D18p40  <- quantile(GinTheD18$INGLABO, 0.40)
D18p90  <- quantile(GinTheD18$INGLABO, 0.90)

Ing40D18 = sum(GinTheD18$INGLABO[GinTheD18$INGLABO <= D18p40])
Ing10D18 = sum(GinTheD18$INGLABO[GinTheD18$INGLABO >= D18p90])
PalmaD18 = Ing10D18/Ing40D18

AtkD18 = Atkinson(GinTheD18$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD18 = Theil(GinTheD18$INGLABO, parameter = 0)

##### 19 -> Cauca
GinTheD19 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD19 <- filter(GinTheD19,DPTO=="19")

GiniD19 <- Gini(GinTheD19$INGLABO)

D19p40  <- quantile(GinTheD19$INGLABO, 0.40)
D19p90  <- quantile(GinTheD19$INGLABO, 0.90)

Ing40D19 = sum(GinTheD19$INGLABO[GinTheD19$INGLABO <= D19p40])
Ing10D19 = sum(GinTheD19$INGLABO[GinTheD19$INGLABO >= D19p90])
PalmaD19 = Ing10D19/Ing40D19

AtkD19 = Atkinson(GinTheD19$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD19 = Theil(GinTheD19$INGLABO, parameter = 0)

##### 20 -> Cesár
GinTheD20 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD20 <- filter(GinTheD20,DPTO=="20")

GiniD20 <- Gini(GinTheD20$INGLABO)

D20p40  <- quantile(GinTheD20$INGLABO, 0.40)
D20p90  <- quantile(GinTheD20$INGLABO, 0.90)

Ing40D20 = sum(GinTheD20$INGLABO[GinTheD20$INGLABO <= D20p40])
Ing10D20 = sum(GinTheD20$INGLABO[GinTheD20$INGLABO >= D20p90])
PalmaD20 = Ing10D20/Ing40D20

AtkD20 = Atkinson(GinTheD20$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD20 = Theil(GinTheD20$INGLABO, parameter = 0)

##### 23 -> Córdoba
GinTheD23 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD23 <- filter(GinTheD23,DPTO=="23")

GiniD23 <- Gini(GinTheD23$INGLABO)

D23p40  <- quantile(GinTheD23$INGLABO, 0.40)
D23p90  <- quantile(GinTheD23$INGLABO, 0.90)

Ing40D23 = sum(GinTheD23$INGLABO[GinTheD23$INGLABO <= D23p40])
Ing10D23 = sum(GinTheD23$INGLABO[GinTheD23$INGLABO >= D23p90])
PalmaD23 = Ing10D23/Ing40D23

AtkD23 = Atkinson(GinTheD23$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD23 = Theil(GinTheD23$INGLABO, parameter = 0)

##### 25 -> Cundinamarca
GinTheD25 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD25 <- filter(GinTheD25,DPTO=="25")

GiniD25 <- Gini(GinTheD25$INGLABO)

D25p40  <- quantile(GinTheD25$INGLABO, 0.40)
D25p90  <- quantile(GinTheD25$INGLABO, 0.90)

Ing40D25 = sum(GinTheD25$INGLABO[GinTheD25$INGLABO <= D25p40])
Ing10D25 = sum(GinTheD25$INGLABO[GinTheD25$INGLABO >= D25p90])
PalmaD25 = Ing10D25/Ing40D25

AtkD25 = Atkinson(GinTheD25$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD25 = Theil(GinTheD25$INGLABO, parameter = 0)

##### 27 -> Chocó
GinTheD27 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD27 <- filter(GinTheD27,DPTO=="27")

GiniD27 <- Gini(GinTheD27$INGLABO)

D27p40  <- quantile(GinTheD27$INGLABO, 0.40)
D27p90  <- quantile(GinTheD27$INGLABO, 0.90)

Ing40D27 = sum(GinTheD27$INGLABO[GinTheD27$INGLABO <= D27p40])
Ing10D27 = sum(GinTheD27$INGLABO[GinTheD27$INGLABO >= D27p90])
PalmaD27 = Ing10D27/Ing40D27

AtkD27 = Atkinson(GinTheD27$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD27 = Theil(GinTheD27$INGLABO, parameter = 0)

##### 41 -> Huila
GinTheD41 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD41 <- filter(GinTheD41,DPTO=="41")

GiniD41 <- Gini(GinTheD41$INGLABO)

D41p40  <- quantile(GinTheD41$INGLABO, 0.40)
D41p90  <- quantile(GinTheD41$INGLABO, 0.90)

Ing40D41 = sum(GinTheD41$INGLABO[GinTheD41$INGLABO <= D41p40])
Ing10D41 = sum(GinTheD41$INGLABO[GinTheD41$INGLABO >= D41p90])
PalmaD41 = Ing10D41/Ing40D41

AtkD41 = Atkinson(GinTheD41$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD41 = Theil(GinTheD41$INGLABO, parameter = 0)

##### 44 -> La Guajira
GinTheD44 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD44 <- filter(GinTheD44,DPTO=="44")

GiniD44 <- Gini(GinTheD44$INGLABO)

D44p40  <- quantile(GinTheD44$INGLABO, 0.40)
D44p90  <- quantile(GinTheD44$INGLABO, 0.90)

Ing40D44 = sum(GinTheD44$INGLABO[GinTheD44$INGLABO <= D44p40])
Ing10D44 = sum(GinTheD44$INGLABO[GinTheD44$INGLABO >= D44p90])
PalmaD44 = Ing10D44/Ing40D44

AtkD44 = Atkinson(GinTheD44$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD44 = Theil(GinTheD44$INGLABO, parameter = 0)

##### 47 -> Magdalena
GinTheD47 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD47 <- filter(GinTheD47,DPTO=="47")

GiniD47 <- Gini(GinTheD47$INGLABO)

D47p40  <- quantile(GinTheD47$INGLABO, 0.40)
D47p90  <- quantile(GinTheD47$INGLABO, 0.90)

Ing40D47 = sum(GinTheD47$INGLABO[GinTheD47$INGLABO <= D47p40])
Ing10D47 = sum(GinTheD47$INGLABO[GinTheD47$INGLABO >= D47p90])
PalmaD47 = Ing10D47/Ing40D47

AtkD47 = Atkinson(GinTheD47$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD47 = Theil(GinTheD47$INGLABO, parameter = 0)

##### 50 -> Meta
GinTheD50 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD50 <- filter(GinTheD50,DPTO=="50")

GiniD50 <- Gini(GinTheD50$INGLABO)

D50p40  <- quantile(GinTheD50$INGLABO, 0.40)
D50p90  <- quantile(GinTheD50$INGLABO, 0.90)

Ing40D50 = sum(GinTheD50$INGLABO[GinTheD50$INGLABO <= D50p40])
Ing10D50 = sum(GinTheD50$INGLABO[GinTheD50$INGLABO >= D50p90])
PalmaD50 = Ing10D50/Ing40D50

AtkD50 = Atkinson(GinTheD50$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD50 = Theil(GinTheD50$INGLABO, parameter = 0)

##### 52 -> Nariño
GinTheD52 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD52 <- filter(GinTheD52,DPTO=="52")

GiniD52 <- Gini(GinTheD52$INGLABO)

D52p40  <- quantile(GinTheD52$INGLABO, 0.40)
D52p90  <- quantile(GinTheD52$INGLABO, 0.90)

Ing40D52 = sum(GinTheD52$INGLABO[GinTheD52$INGLABO <= D52p40])
Ing10D52 = sum(GinTheD52$INGLABO[GinTheD52$INGLABO >= D52p90])
PalmaD52 = Ing10D52/Ing40D52

AtkD52 = Atkinson(GinTheD52$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD52 = Theil(GinTheD52$INGLABO, parameter = 0)

##### 54 -> Nor. Santander
GinTheD54 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD54 <- filter(GinTheD54,DPTO=="54")

GiniD54 <- Gini(GinTheD54$INGLABO)

D54p40  <- quantile(GinTheD54$INGLABO, 0.40)
D54p90  <- quantile(GinTheD54$INGLABO, 0.90)

Ing40D54 = sum(GinTheD54$INGLABO[GinTheD54$INGLABO <= D54p40])
Ing10D54 = sum(GinTheD54$INGLABO[GinTheD54$INGLABO >= D54p90])
PalmaD54 = Ing10D54/Ing40D54

AtkD54 = Atkinson(GinTheD54$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD54 = Theil(GinTheD54$INGLABO, parameter = 0)

##### 63 -> Quindio
GinTheD63 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD63 <- filter(GinTheD63,DPTO=="63")

GiniD63 <- Gini(GinTheD63$INGLABO)

D63p40  <- quantile(GinTheD63$INGLABO, 0.40)
D63p90  <- quantile(GinTheD63$INGLABO, 0.90)

Ing40D63 = sum(GinTheD63$INGLABO[GinTheD63$INGLABO <= D63p40])
Ing10D63 = sum(GinTheD63$INGLABO[GinTheD63$INGLABO >= D63p90])
PalmaD63 = Ing10D63/Ing40D63

AtkD63 = Atkinson(GinTheD63$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD63 = Theil(GinTheD63$INGLABO, parameter = 0)

##### 66 -> Risaralda
GinTheD66 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD66 <- filter(GinTheD66,DPTO=="66")

GiniD66 <- Gini(GinTheD66$INGLABO)

D66p40  <- quantile(GinTheD66$INGLABO, 0.40)
D66p90  <- quantile(GinTheD66$INGLABO, 0.90)

Ing40D66 = sum(GinTheD66$INGLABO[GinTheD66$INGLABO <= D66p40])
Ing10D66 = sum(GinTheD66$INGLABO[GinTheD66$INGLABO >= D66p90])
PalmaD66 = Ing10D66/Ing40D66

AtkD66 = Atkinson(GinTheD66$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD66 = Theil(GinTheD66$INGLABO, parameter = 0)

##### 68 -> Santander
GinTheD68 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD68 <- filter(GinTheD68,DPTO=="68")

GiniD68 <- Gini(GinTheD68$INGLABO)

D68p40  <- quantile(GinTheD68$INGLABO, 0.40)
D68p90  <- quantile(GinTheD68$INGLABO, 0.90)

Ing40D68 = sum(GinTheD68$INGLABO[GinTheD68$INGLABO <= D68p40])
Ing10D68 = sum(GinTheD68$INGLABO[GinTheD68$INGLABO >= D68p90])
PalmaD68 = Ing10D68/Ing40D68

AtkD68 = Atkinson(GinTheD68$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD68 = Theil(GinTheD68$INGLABO, parameter = 0)

##### 70 -> Sucre
GinTheD70 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD70 <- filter(GinTheD70,DPTO=="70")

GiniD70 <- Gini(GinTheD70$INGLABO)

D70p40  <- quantile(GinTheD70$INGLABO, 0.40)
D70p90  <- quantile(GinTheD70$INGLABO, 0.90)

Ing40D70 = sum(GinTheD70$INGLABO[GinTheD70$INGLABO <= D70p40])
Ing10D70 = sum(GinTheD70$INGLABO[GinTheD70$INGLABO >= D70p90])
PalmaD70 = Ing10D70/Ing40D70

AtkD70 = Atkinson(GinTheD70$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD70 = Theil(GinTheD70$INGLABO, parameter = 0)

##### 73 -> Tolima
GinTheD73 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD73 <- filter(GinTheD73,DPTO=="73")

GiniD73 <- Gini(GinTheD73$INGLABO)

D73p40  <- quantile(GinTheD73$INGLABO, 0.40)
D73p90  <- quantile(GinTheD73$INGLABO, 0.90)

Ing40D73 = sum(GinTheD73$INGLABO[GinTheD73$INGLABO <= D73p40])
Ing10D73 = sum(GinTheD73$INGLABO[GinTheD73$INGLABO >= D73p90])
PalmaD73 = Ing10D73/Ing40D73

AtkD73 = Atkinson(GinTheD73$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD73 = Theil(GinTheD73$INGLABO, parameter = 0)

##### 76 -> Valle del Cauca
GinTheD76 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD76 <- filter(GinTheD76,DPTO=="76")

GiniD76 <- Gini(GinTheD76$INGLABO)

D76p40  <- quantile(GinTheD76$INGLABO, 0.40)
D76p90  <- quantile(GinTheD76$INGLABO, 0.90)

Ing40D76 = sum(GinTheD76$INGLABO[GinTheD76$INGLABO <= D76p40])
Ing10D76 = sum(GinTheD76$INGLABO[GinTheD76$INGLABO >= D76p90])
PalmaD76 = Ing10D76/Ing40D76

AtkD76 = Atkinson(GinTheD76$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD76 = Theil(GinTheD76$INGLABO, parameter = 0)

##### 81 -> Arauca
GinTheD81 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD81 <- filter(GinTheD81,DPTO=="81")

GiniD81 <- Gini(GinTheD81$INGLABO)

D81p40  <- quantile(GinTheD81$INGLABO, 0.40)
D81p90  <- quantile(GinTheD81$INGLABO, 0.90)

Ing40D81 = sum(GinTheD81$INGLABO[GinTheD81$INGLABO <= D81p40])
Ing10D81 = sum(GinTheD81$INGLABO[GinTheD81$INGLABO >= D81p90])
PalmaD81 = Ing10D81/Ing40D81

AtkD81 = Atkinson(GinTheD81$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD81 = Theil(GinTheD81$INGLABO, parameter = 0)

##### 85 -> Casanare
GinTheD85 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD85 <- filter(GinTheD85,DPTO=="85")

GiniD85 <- Gini(GinTheD85$INGLABO)

D85p40  <- quantile(GinTheD85$INGLABO, 0.40)
D85p90  <- quantile(GinTheD85$INGLABO, 0.90)

Ing40D85 = sum(GinTheD85$INGLABO[GinTheD85$INGLABO <= D85p40])
Ing10D85 = sum(GinTheD85$INGLABO[GinTheD85$INGLABO >= D85p90])
PalmaD85 = Ing10D85/Ing40D85

AtkD85 = Atkinson(GinTheD85$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD85 = Theil(GinTheD85$INGLABO, parameter = 0)

##### 86 -> Putumayo
GinTheD86 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD86 <- filter(GinTheD86,DPTO=="86")

GiniD86 <- Gini(GinTheD86$INGLABO)

D86p40  <- quantile(GinTheD86$INGLABO, 0.40)
D86p90  <- quantile(GinTheD86$INGLABO, 0.90)

Ing40D86 = sum(GinTheD86$INGLABO[GinTheD86$INGLABO <= D86p40])
Ing10D86 = sum(GinTheD86$INGLABO[GinTheD86$INGLABO >= D86p90])
PalmaD86 = Ing10D86/Ing40D86

AtkD86 = Atkinson(GinTheD86$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD86 = Theil(GinTheD86$INGLABO, parameter = 0)

##### 88 -> San Andres
GinTheD88 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD88 <- filter(GinTheD88,DPTO=="88")

GiniD88 <- Gini(GinTheD88$INGLABO)

D88p40  <- quantile(GinTheD88$INGLABO, 0.40)
D88p90  <- quantile(GinTheD88$INGLABO, 0.90)

Ing40D88 = sum(GinTheD88$INGLABO[GinTheD88$INGLABO <= D88p40])
Ing10D88 = sum(GinTheD88$INGLABO[GinTheD88$INGLABO >= D88p90])
PalmaD88 = Ing10D88/Ing40D88

AtkD88 = Atkinson(GinTheD88$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD88 = Theil(GinTheD88$INGLABO, parameter = 0)

##### 91 -> Amazonas
GinTheD91 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD91 <- filter(GinTheD91,DPTO=="91")

GiniD91 <- Gini(GinTheD91$INGLABO)

D91p40  <- quantile(GinTheD91$INGLABO, 0.40)
D91p90  <- quantile(GinTheD91$INGLABO, 0.90)

Ing40D91 = sum(GinTheD91$INGLABO[GinTheD91$INGLABO <= D91p40])
Ing10D91 = sum(GinTheD91$INGLABO[GinTheD91$INGLABO >= D91p90])
PalmaD91 = Ing10D91/Ing40D91

AtkD91 = Atkinson(GinTheD91$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD91 = Theil(GinTheD91$INGLABO, parameter = 0)

##### 94 -> Guainía
GinTheD94 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD94 <- filter(GinTheD94,DPTO=="94")

GiniD94 <- Gini(GinTheD94$INGLABO)

D94p40  <- quantile(GinTheD94$INGLABO, 0.40)
D94p90  <- quantile(GinTheD94$INGLABO, 0.90)

Ing40D94 = sum(GinTheD94$INGLABO[GinTheD94$INGLABO <= D94p40])
Ing10D94 = sum(GinTheD94$INGLABO[GinTheD94$INGLABO >= D94p90])
PalmaD94 = Ing10D94/Ing40D94

AtkD94 = Atkinson(GinTheD94$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD94 = Theil(GinTheD94$INGLABO, parameter = 0)

##### 95 -> Guaviare
GinTheD95 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD95 <- filter(GinTheD95,DPTO=="95")

GiniD95 <- Gini(GinTheD95$INGLABO)

D95p40  <- quantile(GinTheD95$INGLABO, 0.40)
D95p90  <- quantile(GinTheD95$INGLABO, 0.90)

Ing40D95 = sum(GinTheD95$INGLABO[GinTheD95$INGLABO <= D95p40])
Ing10D95 = sum(GinTheD95$INGLABO[GinTheD95$INGLABO >= D95p90])
PalmaD95 = Ing10D95/Ing40D95

AtkD95 = Atkinson(GinTheD95$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD95 = Theil(GinTheD95$INGLABO, parameter = 0)

##### 97 -> Vaupés
GinTheD97 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD97 <- filter(GinTheD97,DPTO=="97")

GiniD97 <- Gini(GinTheD97$INGLABO)

D97p40  <- quantile(GinTheD97$INGLABO, 0.40)
D97p90  <- quantile(GinTheD97$INGLABO, 0.90)

Ing40D97 = sum(GinTheD97$INGLABO[GinTheD97$INGLABO <= D97p40])
Ing10D97 = sum(GinTheD97$INGLABO[GinTheD97$INGLABO >= D97p90])
PalmaD97 = Ing10D97/Ing40D97

AtkD97 = Atkinson(GinTheD97$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD97 = Theil(GinTheD97$INGLABO, parameter = 0)

##### 99 -> Vichada
GinTheD99 <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTheD99 <- filter(GinTheD99,DPTO=="99")

GiniD99 <- Gini(GinTheD99$INGLABO)

D99p40  <- quantile(GinTheD99$INGLABO, 0.40)
D99p90  <- quantile(GinTheD99$INGLABO, 0.90)

Ing40D99 = sum(GinTheD99$INGLABO[GinTheD99$INGLABO <= D99p40])
Ing10D99 = sum(GinTheD99$INGLABO[GinTheD99$INGLABO >= D99p90])
PalmaD99 = Ing10D99/Ing40D99

AtkD99 = Atkinson(GinTheD99$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilD99 = Theil(GinTheD99$INGLABO, parameter = 0)

#  Totales #################

GinTheTot <- Total[order(+Total$INGLABO, na.last = NA), ]
GinTot = Gini(GinTheTot$INGLABO)

Totp40  <- quantile(GinTheTot$INGLABO, 0.40)
Totp90  <- quantile(GinTheTot$INGLABO, 0.90)

Ing40Tot = sum(GinTheTot$INGLABO[GinTheTot$INGLABO <= Totp40])
Ing10Tot = sum(GinTheTot$INGLABO[GinTheTot$INGLABO >= Totp90])
PalmaTot = Ing10Tot/Ing40Tot

AtkTot = Atkinson(GinTheTot$INGLABO, parameter = 0.75) ## https://repositorio.unican.es/xmlui/bitstream/handle/10902/8102/DOSALCARMONAIRENE.pdf?sequence=1

TheilTot = Theil(GinTheTot$INGLABO, parameter = 0)

# Crear un dataframe con los valores de las tablas
datos <- data.frame(
  Variable = c("Gini20", "Gini21", "Gini22", "Gini23", "Gini24", 
               "GiniD05", "GiniD08", "GiniD11", 
               "GiniD13", "GiniD15", "GiniD17", "GiniD18", "GiniD19", "GiniD20", "GiniD23", 
               "GiniD25", "GiniD27", "GiniD41", "GiniD44", "GiniD47", 
               "GiniD50", "GiniD52", "GiniD54", "GiniD63", "GiniD66", "GiniD68", "GiniD70", 
               "GiniD73", "GiniD76", "GiniD81", "GiniD85", "GiniD86", "GiniD88", "GiniD91", 
               "GiniD94", "GiniD95", "GiniD97", "GiniD99", 
               "InterThe20", "InterThe21", "InterThe22", "InterThe23", "InterThe24", 
               "IntraThe20", "IntraThe21", "IntraThe22", "IntraThe23", "IntraThe24", 
               "The20", "The21", "The22", "The23", "The24", 
               "TheilD05", "TheilD08", "TheilD11", "TheilD13", 
               "TheilD15", "TheilD17", "TheilD18", "TheilD19", "TheilD20", "TheilD23", "TheilD25", 
               "TheilD27", "TheilD41", "TheilD44", "TheilD47", "TheilD50", "TheilD52", "TheilD54", 
               "TheilD63", "TheilD66", "TheilD68", "TheilD70", "TheilD73", "TheilD76", "TheilD81", 
               "TheilD85", "TheilD86", "TheilD88", "TheilD91", "TheilD94", "TheilD95", "TheilD97", 
               "TheilD99", "Palma20", "Palma21", "Palma22", "Palma23", "Palma24", 
               "PalmaD05", "PalmaD08", "PalmaD11", 
               "PalmaD13", "PalmaD15", "PalmaD17", "PalmaD18", "PalmaD19", "PalmaD20", "PalmaD23", 
               "PalmaD25", "PalmaD27", "PalmaD41", "PalmaD44", "PalmaD47", 
               "PalmaD50", "PalmaD52", "PalmaD54", "PalmaD63", "PalmaD66", "PalmaD68", "PalmaD70", 
               "PalmaD73", "PalmaD76", "PalmaD81", "PalmaD85", "PalmaD86", "PalmaD88", "PalmaD91", 
               "PalmaD94", "PalmaD95", "PalmaD97", "PalmaD99",
               "Atk20", "Atk21", "Atk22", "Atk23", "Atk24", 
               "AtkD05", "AtkD08", "AtkD11", 
               "AtkD13", "AtkD15", "AtkD17", "AtkD18", "AtkD19", "AtkD20", "AtkD23", 
               "AtkD25", "AtkD27", "AtkD41", "AtkD44", "AtkD47", 
               "AtkD50", "AtkD52", "AtkD54", "AtkD63", "AtkD66", "AtkD68", "AtkD70", 
               "AtkD73", "AtkD76", "AtkD81", "AtkD85", "AtkD86", "AtkD88", "AtkD91", 
               "AtkD94", "AtkD95", "AtkD97", "AtkD99",
               "GinTot", "TheilTot", "PalmaTot", "AtkTot"),
  Valor = c(Gini20, Gini21, Gini22, Gini23, Gini24,
            GiniD05, GiniD08, GiniD11,
            GiniD13, GiniD15, GiniD17, GiniD18, GiniD19, GiniD20, GiniD23,
            GiniD25, GiniD27, GiniD41, GiniD44, GiniD47,
            GiniD50, GiniD52, GiniD54, GiniD63, GiniD66, GiniD68, GiniD70,
            GiniD73, GiniD76, GiniD81, GiniD85, GiniD86, GiniD88, GiniD91,
            GiniD94, GiniD95, GiniD97, GiniD99,
            InterThe20, InterThe21, InterThe22, InterThe23, InterThe24,
            IntraThe20, IntraThe21, IntraThe22, IntraThe23, IntraThe24,
            The20, The21, The22, The23, The24,
            TheilD05, TheilD08, TheilD11, TheilD13,
            TheilD15, TheilD17, TheilD18, TheilD19, TheilD20, TheilD23, TheilD25,
            TheilD27, TheilD41, TheilD44, TheilD47, TheilD50, TheilD52, TheilD54,
            TheilD63, TheilD66, TheilD68, TheilD70, TheilD73, TheilD76, TheilD81,
            TheilD85, TheilD86, TheilD88, TheilD91, TheilD94, TheilD95, TheilD97, TheilD99,
            Palma20, Palma21, Palma22, Palma23, Palma24,
            PalmaD05, PalmaD08, PalmaD11,
            PalmaD13, PalmaD15, PalmaD17, PalmaD18, PalmaD19, PalmaD20, PalmaD23,
            PalmaD25, PalmaD27, PalmaD41, PalmaD44, PalmaD47,
            PalmaD50, PalmaD52, PalmaD54, PalmaD63, PalmaD66, PalmaD68, PalmaD70,
            PalmaD73, PalmaD76, PalmaD81, PalmaD85, PalmaD86, PalmaD88, PalmaD91,
            PalmaD94, PalmaD95, PalmaD97, PalmaD99,
            Atk20, Atk21, Atk22, Atk23, Atk24,
            AtkD05, AtkD08, AtkD11,
            AtkD13, AtkD15, AtkD17, AtkD18, AtkD19, AtkD20, AtkD23,
            AtkD25, AtkD27, AtkD41, AtkD44, AtkD47,
            AtkD50, AtkD52, AtkD54, AtkD63, AtkD66, AtkD68, AtkD70,
            AtkD73, AtkD76, AtkD81, AtkD85, AtkD86, AtkD88, AtkD91,
            AtkD94, AtkD95, AtkD97, AtkD99,
            GinTot, TheilTot, PalmaTot, AtkTot)
)

write.xlsx(datos, "Output/Datos.xlsx")
