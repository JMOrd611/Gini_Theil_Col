clear all
version 17

*======================================================================
* 01_GEIH.do
* Apila y limpia los microdatos de la GEIH, 2020-2024.
* Genera Output/Total.DTA con ingreso total deflactado por persona.
*
* UNICO AJUSTE NECESARIO: la ruta en el global root.
*
* Fuente: Departamento Administrativo Nacional de Estadistica:
* www.dane.gov.co
*======================================================================

global root "C:/ruta/a/desigualdad-salarial-colombia"
cd "$root"

cap mkdir "Temp"
cap mkdir "Output"

**************************************************************
***************-------2020----------**************************
**************************************************************

use "Data/Ene2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1
save "Temp/Ene2020.DTA", replace

use "Data/Feb2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 
save "Temp/Feb2020.DTA", replace

use "Data/Mar2020I.DTA"
keep MES DPTO INGLABO
save "Temp/Mar2020.DTA", replace

use "Data/Abr2020I.DTA" 
keep MES DPTO INGLABO
save "Temp/Abr2020.DTA", replace

use "Data/May2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2020II.DTA"
drop _merge 
keep MES DPTO INGLABO P7422S1 
save "Temp/May2020.DTA", replace

use "Data/Jun2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2020II.DTA"
drop _merge 
keep MES DPTO INGLABO P7422S1 
save "Temp/Jun2020.DTA", replace

use "Data/Jul2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2020II.DTA"
drop _merge 
keep MES DPTO INGLABO P7422S1 
save "Temp/Jul2020.DTA", replace

use "Data/Ago2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 
save "Temp/Ago2020.DTA", replace

use "Data/Sep2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 
save "Temp/Sep2020.DTA", replace

use "Data/Oct2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 
save "Temp/Oct2020.DTA", replace

use "Data/Nov2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 
save "Temp/Nov2020.DTA", replace

use "Data/Dic2020I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2020II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2020III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2020IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 
save "Temp/Dic2020.DTA", replace

use "Temp/Ene2020.DTA"
append using "Temp/Feb2020.DTA"
append using "Temp/Mar2020.DTA"
append using "Temp/Abr2020.DTA"
append using "Temp/May2020.DTA"
append using "Temp/Jun2020.DTA"
append using "Temp/Jul2020.DTA"
append using "Temp/Ago2020.DTA"
append using "Temp/Sep2020.DTA"
append using "Temp/Oct2020.DTA"
append using "Temp/Nov2020.DTA"
append using "Temp/Dic2020.DTA"
gen Ano = 2020

destring MES DPTO, replace
ren P7500S1A1 ALQUILER
ren P7500S2A1 PENSIOJUB
ren P7500S3A1 PENALIM
ren P7510S1A1 APORTESFAMI
ren P7510S2A1 REMESAS
ren P7510S3A1 AUXINST
ren P7510S5A1 INGRESOSFINAN
ren P7510S6A1 CESANTIAS
ren P7510S7A1 INGOCACIONALES
ren P7422S1  INGnoOCUPA
// ren P3087S1 INGotrasfor
ren AUXINST INGRESOL
// destring INGotrasfor, replace
egen OTROSINGRE = rowtotal(PENSIOJUB PENALIM REMESAS APORTESFAMI INGRESOSFINAN CESANTIAS INGOCACIONALES INGnoOCUPA /*INGotrasfor*/)
egen  INGRETOTAL = rowtotal(INGLABO INGRESOL OTROSINGRE)
ren INGRETOTAL INGTOTALPERSO
drop if INGLABO ==. & ALQUILER ==. & INGnoOCUPA ==. & PENSIOJUB ==. & PENALIM ==. & APORTESFAMI ==. & REMESAS ==. & INGRESOL ==. & INGRESOSFINAN ==. & CESANTIAS ==. & INGOCACIONALES ==.
keep MES DPTO INGTOTALPERSO Ano

save "Temp/2020.DTA", replace
clear all
**************************************************************
***************-------2021----------**************************
**************************************************************
use "Data/Ene2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Ene2021.DTA", replace

use "Data/Feb2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Feb2021.DTA", replace

use "Data/Mar2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Mar2021.DTA", replace

use "Data/Abr2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Abr2021.DTA", replace

use "Data/May2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
replace MES = "05"
save "Temp/May2021.DTA", replace

use "Data/Jun2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
replace MES = "06"
save "Temp/Jun2021.DTA", replace

use "Data/Jul2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
replace MES = "07"
save "Temp/Jul2021.DTA", replace

use "Data/Ago2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
replace MES = "08"
save "Temp/Ago2021.DTA", replace

use "Data/Sep2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
replace MES = "09"
save "Temp/Sep2021.DTA", replace

use "Data/Oct2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Oct2021.DTA", replace

use "Data/Nov2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Nov2021.DTA", replace

use "Data/Dic2021I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2021II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2021III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2021IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Dic2021.DTA", replace

use "Temp/Ene2021.DTA"
append using "Temp/Feb2021.DTA"
append using "Temp/Mar2021.DTA"
append using "Temp/Abr2021.DTA"
append using "Temp/May2021.DTA"
append using "Temp/Jun2021.DTA"
append using "Temp/Jul2021.DTA"
append using "Temp/Ago2021.DTA"
append using "Temp/Sep2021.DTA"
append using "Temp/Oct2021.DTA"
append using "Temp/Nov2021.DTA"
append using "Temp/Dic2021.DTA"
gen Ano = 2021

destring MES DPTO, replace
ren P7500S1A1 ALQUILER
ren P7500S2A1 PENSIOJUB
ren P7500S3A1 PENALIM
ren P7510S1A1 APORTESFAMI
ren P7510S2A1 REMESAS
ren P7510S3A1 AUXINST
ren P7510S5A1 INGRESOSFINAN
ren P7510S6A1 CESANTIAS
ren P7510S7A1 INGOCACIONALES
ren P7422S1  INGnoOCUPA
ren P3087S1 INGotrasfor
ren AUXINST INGRESOL
destring INGotrasfor, replace
egen OTROSINGRE = rowtotal(PENSIOJUB PENALIM REMESAS APORTESFAMI INGRESOSFINAN CESANTIAS INGOCACIONALES INGnoOCUPA INGotrasfor)
egen  INGRETOTAL = rowtotal(INGLABO INGRESOL OTROSINGRE)
ren INGRETOTAL INGTOTALPERSO
drop if INGLABO ==. & ALQUILER ==. & INGnoOCUPA ==. & PENSIOJUB ==. & PENALIM ==. & APORTESFAMI ==. & REMESAS ==. & INGRESOL ==. & INGRESOSFINAN ==. & CESANTIAS ==. & INGOCACIONALES ==.
keep MES DPTO INGTOTALPERSO Ano

save "Temp/2021.DTA", replace
clear all
**************************************************************
***************-------2022----------**************************
**************************************************************
use "Data/Ene2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
save "Temp/Ene2022.DTA", replace

use "Data/Feb2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
replace MES = 2 if MES == 1
save "Temp/Feb2022.DTA", replace

use "Data/Mar2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
replace MES = 3 if MES == 1
save "Temp/Mar2022.DTA", replace

use "Data/Abr2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
replace MES = 4 if MES == 1
save "Temp/Abr2022.DTA", replace

use "Data/May2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
replace MES = 5 if MES == 1
save "Temp/May2022.DTA", replace

use "Data/Jun2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
replace MES = 6 if MES == 1
save "Temp/Jun2022.DTA", replace

use "Data/Jul2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
save "Temp/Jul2022.DTA", replace

use "Data/Ago2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
replace MES = 8 if MES == 1
save "Temp/Ago2022.DTA", replace

use "Data/Sep2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
save "Temp/Sep2022.DTA", replace

use "Data/Oct2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
save "Temp/Oct2022.DTA", replace

use "Data/Nov2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
save "Temp/Nov2022.DTA", replace

use "Data/Dic2022I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2022II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2022III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2022IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
destring MES, replace
save "Temp/Dic2022.DTA", replace

use "Temp/Ene2022.DTA"
append using "Temp/Feb2022.DTA"
append using "Temp/Mar2022.DTA"
append using "Temp/Abr2022.DTA"
append using "Temp/May2022.DTA"
append using "Temp/Jun2022.DTA"
append using "Temp/Jul2022.DTA"
append using "Temp/Ago2022.DTA"
append using "Temp/Sep2022.DTA"
append using "Temp/Oct2022.DTA"
append using "Temp/Nov2022.DTA"
append using "Temp/Dic2022.DTA"
gen Ano = 2022

destring MES DPTO, replace
ren P7500S1A1 ALQUILER
ren P7500S2A1 PENSIOJUB
ren P7500S3A1 PENALIM
ren P7510S1A1 APORTESFAMI
ren P7510S2A1 REMESAS
ren P7510S3A1 AUXINST
ren P7510S5A1 INGRESOSFINAN
ren P7510S6A1 CESANTIAS
ren P7510S7A1 INGOCACIONALES
ren P7422S1  INGnoOCUPA
ren P3087S1 INGotrasfor
ren AUXINST INGRESOL
destring INGotrasfor, replace
egen OTROSINGRE = rowtotal(PENSIOJUB PENALIM REMESAS APORTESFAMI INGRESOSFINAN CESANTIAS INGOCACIONALES INGnoOCUPA INGotrasfor)
egen  INGRETOTAL = rowtotal(INGLABO INGRESOL OTROSINGRE)
ren INGRETOTAL INGTOTALPERSO
drop if INGLABO ==. & ALQUILER ==. & INGnoOCUPA ==. & PENSIOJUB ==. & PENALIM ==. & APORTESFAMI ==. & REMESAS ==. & INGRESOL ==. & INGRESOSFINAN ==. & CESANTIAS ==. & INGOCACIONALES ==.
keep MES DPTO INGTOTALPERSO Ano

save "Temp/2022.DTA", replace
clear all
**************************************************************
***************-------2023----------**************************
**************************************************************
use "Data/Ene2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Ene2023.DTA", replace

use "Data/Feb2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Feb2023.DTA", replace

use "Data/Mar2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Mar2023.DTA", replace

use "Data/Abr2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Abr2023.DTA", replace

use "Data/May2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/May2023.DTA", replace

use "Data/Jun2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Jun2023.DTA", replace

use "Data/Jul2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Jul2023.DTA", replace

use "Data/Ago2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Ago2023.DTA", replace

use "Data/Sep2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Sep2023.DTA", replace

use "Data/Oct2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Oct2023.DTA", replace

use "Data/Nov2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Nov2023.DTA", replace

use "Data/Dic2023I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2023II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2023III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2023IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Dic2023.DTA", replace

use "Temp/Ene2023.DTA"
append using "Temp/Feb2023.DTA"
append using "Temp/Mar2023.DTA"
append using "Temp/Abr2023.DTA"
append using "Temp/May2023.DTA"
append using "Temp/Jun2023.DTA"
append using "Temp/Jul2023.DTA"
append using "Temp/Ago2023.DTA"
append using "Temp/Sep2023.DTA"
append using "Temp/Oct2023.DTA"
append using "Temp/Nov2023.DTA"
append using "Temp/Dic2023.DTA"
gen Ano = 2023

destring MES DPTO, replace
ren P7500S1A1 ALQUILER
ren P7500S2A1 PENSIOJUB
ren P7500S3A1 PENALIM
ren P7510S1A1 APORTESFAMI
ren P7510S2A1 REMESAS
ren P7510S3A1 AUXINST
ren P7510S5A1 INGRESOSFINAN
ren P7510S6A1 CESANTIAS
ren P7510S7A1 INGOCACIONALES
ren P7422S1  INGnoOCUPA
ren P3087S1 INGotrasfor
ren AUXINST INGRESOL
destring INGotrasfor, replace
egen OTROSINGRE = rowtotal(PENSIOJUB PENALIM REMESAS APORTESFAMI INGRESOSFINAN CESANTIAS INGOCACIONALES INGnoOCUPA INGotrasfor)
egen  INGRETOTAL = rowtotal(INGLABO INGRESOL OTROSINGRE)
ren INGRETOTAL INGTOTALPERSO
drop if INGLABO ==. & ALQUILER ==. & INGnoOCUPA ==. & PENSIOJUB ==. & PENALIM ==. & APORTESFAMI ==. & REMESAS ==. & INGRESOL ==. & INGRESOSFINAN ==. & CESANTIAS ==. & INGOCACIONALES ==.
keep MES DPTO INGTOTALPERSO Ano

save "Temp/2023.DTA", replace
clear all
**************************************************************
***************-------2024----------**************************
**************************************************************
use "Data/Ene2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ene2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Ene2024.DTA", replace

use "Data/Feb2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Feb2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Feb2024.DTA", replace

use "Data/Mar2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Mar2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Mar2024.DTA", replace

use "Data/Abr2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Abr2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Abr2024.DTA", replace

use "Data/May2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/May2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/May2024.DTA", replace

use "Data/Jun2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jun2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Jun2024.DTA", replace

use "Data/Jul2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Jul2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Jul2024.DTA", replace

use "Data/Ago2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Ago2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Ago2024.DTA", replace

use "Data/Sep2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Sep2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Sep2024.DTA", replace

use "Data/Oct2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Oct2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Oct2024.DTA", replace

use "Data/Nov2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Nov2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Nov2024.DTA", replace

use "Data/Dic2024I.DTA"
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2024II.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2024III.DTA"
drop _merge 
merge 1:1 DIRECTORIO SECUENCIA_P ORDEN using "Data/Dic2024IV.DTA"
drop _merge 
keep MES DPTO INGLABO P7500S1A1 P7500S2A1 P7500S3A1 P7510S1A1 P7510S2A1 P7510S3A1 P7510S5A1 P7510S6A1 P7510S7A1 P7422S1 P3087S1      
save "Temp/Dic2024.DTA", replace

use "Temp/Ene2024.DTA"
append using "Temp/Feb2024.DTA"
append using "Temp/Mar2024.DTA"
append using "Temp/Abr2024.DTA"
append using "Temp/May2024.DTA"
append using "Temp/Jun2024.DTA"
append using "Temp/Jul2024.DTA"
append using "Temp/Ago2024.DTA"
append using "Temp/Sep2024.DTA"
append using "Temp/Oct2024.DTA"
append using "Temp/Nov2024.DTA"
append using "Temp/Dic2024.DTA"
gen Ano = 2024

destring MES DPTO, replace
ren P7500S1A1 ALQUILER
ren P7500S2A1 PENSIOJUB
ren P7500S3A1 PENALIM
ren P7510S1A1 APORTESFAMI
ren P7510S2A1 REMESAS
ren P7510S3A1 AUXINST
ren P7510S5A1 INGRESOSFINAN
ren P7510S6A1 CESANTIAS
ren P7510S7A1 INGOCACIONALES
ren P7422S1  INGnoOCUPA
ren P3087S1 INGotrasfor
ren AUXINST INGRESOL
destring INGotrasfor, replace
egen OTROSINGRE = rowtotal(PENSIOJUB PENALIM REMESAS APORTESFAMI INGRESOSFINAN CESANTIAS INGOCACIONALES INGnoOCUPA INGotrasfor)
egen  INGRETOTAL = rowtotal(INGLABO INGRESOL OTROSINGRE)
ren INGRETOTAL INGTOTALPERSO
drop if INGLABO ==. & ALQUILER ==. & INGnoOCUPA ==. & PENSIOJUB ==. & PENALIM ==. & APORTESFAMI ==. & REMESAS ==. & INGRESOL ==. & INGRESOSFINAN ==. & CESANTIAS ==. & INGOCACIONALES ==.
keep MES DPTO INGTOTALPERSO Ano

save "Temp/2024.DTA", replace
clear all

**************************************************************
***************-------Total---------**************************
**************************************************************

use "Temp/2024.DTA"
append using "Temp/2023.DTA"
append using "Temp/2022.DTA"
append using "Temp/2021.DTA", force
append using "Temp/2020.DTA"

ren INGTOTALPERSO Ing

sum Ing

replace Ing = Ing/1.0424 if Ano == 2020 & MES == 1
replace Ing = Ing/1.0494 if Ano == 2020 & MES == 2
replace Ing = Ing/1.0553 if Ano == 2020 & MES == 3
replace Ing = Ing/1.0570 if Ano == 2020 & MES == 4
replace Ing = Ing/1.0536 if Ano == 2020 & MES == 5
replace Ing = Ing/1.0497 if Ano == 2020 & MES == 6
replace Ing = Ing/1.0497 if Ano == 2020 & MES == 7
replace Ing = Ing/1.0426 if Ano == 2020 & MES == 8
replace Ing = Ing/1.0529 if Ano == 2020 & MES == 9
replace Ing = Ing/1.0523 if Ano == 2020 & MES == 10
replace Ing = Ing/1.0508 if Ano == 2020 & MES == 11
replace Ing = Ing/1.0548 if Ano == 2020 & MES == 12

replace Ing = Ing/1.0591 if Ano == 2021 & MES == 1
replace Ing = Ing/1.0658 if Ano == 2021 & MES == 2
replace Ing = Ing/1.0712 if Ano == 2021 & MES == 3
replace Ing = Ing/1.0776 if Ano == 2021 & MES == 4
replace Ing = Ing/1.0884 if Ano == 2021 & MES == 5
replace Ing = Ing/1.0878 if Ano == 2021 & MES == 6
replace Ing = Ing/1.0914 if Ano == 2021 & MES == 7
replace Ing = Ing/1.0962 if Ano == 2021 & MES == 8
replace Ing = Ing/1.1004 if Ano == 2021 & MES == 9
replace Ing = Ing/1.1006 if Ano == 2021 & MES == 10
replace Ing = Ing/1.1060 if Ano == 2021 & MES == 11
replace Ing = Ing/1.1141 if Ano == 2021 & MES == 12

replace Ing = Ing/1.1326 if Ano == 2022 & MES == 1
replace Ing = Ing/1.1511 if Ano == 2022 & MES == 2
replace Ing = Ing/1.1626 if Ano == 2022 & MES == 3
replace Ing = Ing/1.1771 if Ano == 2022 & MES == 4
replace Ing = Ing/1.1870 if Ano == 2022 & MES == 5
replace Ing = Ing/1.1931 if Ano == 2022 & MES == 6
replace Ing = Ing/1.2027 if Ano == 2022 & MES == 7
replace Ing = Ing/1.2150 if Ano == 2022 & MES == 8
replace Ing = Ing/1.2263 if Ano == 2022 & MES == 9
replace Ing = Ing/1.2351 if Ano == 2022 & MES == 10
replace Ing = Ing/1.2446 if Ano == 2022 & MES == 11
replace Ing = Ing/1.2603 if Ano == 2022 & MES == 12

replace Ing = Ing/1.2827 if Ano == 2023 & MES == 1
replace Ing = Ing/1.3040 if Ano == 2023 & MES == 2
replace Ing = Ing/1.3177 if Ano == 2023 & MES == 3
replace Ing = Ing/1.3280 if Ano == 2023 & MES == 4
replace Ing = Ing/1.3338 if Ano == 2023 & MES == 5
replace Ing = Ing/1.3378 if Ano == 2023 & MES == 6
replace Ing = Ing/1.3445 if Ano == 2023 & MES == 7
replace Ing = Ing/1.3539 if Ano == 2023 & MES == 8
replace Ing = Ing/1.3611 if Ano == 2023 & MES == 9
replace Ing = Ing/1.3645 if Ano == 2023 & MES == 10
replace Ing = Ing/1.3709 if Ano == 2023 & MES == 11
replace Ing = Ing/1.3772 if Ano == 2023 & MES == 12

replace Ing = Ing/1.3898 if Ano == 2024 & MES == 1
replace Ing = Ing/1.4049 if Ano == 2024 & MES == 2
replace Ing = Ing/1.4148 if Ano == 2024 & MES == 3
replace Ing = Ing/1.4232 if Ano == 2024 & MES == 4
replace Ing = Ing/1.4292 if Ano == 2024 & MES == 5
replace Ing = Ing/1.4338 if Ano == 2024 & MES == 6
replace Ing = Ing/1.4367 if Ano == 2024 & MES == 7
replace Ing = Ing/1.4367 if Ano == 2024 & MES == 8
replace Ing = Ing/1.4402 if Ano == 2024 & MES == 9
replace Ing = Ing/1.4383 if Ano == 2024 & MES == 10
replace Ing = Ing/1.4422 if Ano == 2024 & MES == 11
replace Ing = Ing/1.4488 if Ano == 2024 & MES == 12

ren Ing INGLABO

save "Output/Total.DTA", replace
clear all
