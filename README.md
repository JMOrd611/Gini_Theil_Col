# Desigualdad salarial en Colombia: una desagregación departamental

Código de la ponencia presentada en el IV Network de Métodos
Cuantitativos (AFADECO, Barranquilla, 2025).

Calcula índices de Gini, Theil, Palma y Atkinson sobre el ingreso total personal, con desagregación departamental, a partir de los microdatos de la GEIH 2020-2024. El índice de Theil se descompone en sus componentes inter e intradepartamental. Los ingresos se deflactan a precios constantes con el IPC mensual.

## Datos

Gran Encuesta Integrada de Hogares (GEIH), 2020-2024. Microdatos públicos disponibles en el [catálogo del DANE](https://microdatos.dane.gov.co/index.php/catalog/MERCLAB-Microdatos).

Los microdatos no se incluyen en este repositorio. Descárgalos y ubícalos en `Data/`.

Para 2020-2023 el script espera los cuatro módulos mensuales con el formato `MesAAAA` + numeral romano del módulo, por ejemplo `Ene2020I.DTA`, `Ene2020II.DTA`, `Ene2020III.DTA`, `Ene2020IV.DTA`. Los cuatro modulos a descargar para cada mes son `Ocupados`, `No Ocupados`, `Otros ingresos e impuestos` y `Otras formas de trabajo`.

Algunos meses o años vienen con menos de cuatro archivos debido a que estos no existen en el repositorio del DANE.

Meses en español abreviados a tres letras: Ene, Feb, Mar, Abr, May, Jun, Jul, Ago, Sep, Oct, Nov, Dic.

Fuente: Departamento Administrativo Nacional de Estadística:
www.dane.gov.co

## Estructura

- `Code/01_GEIH.do` — apila y limpia los microdatos; genera `Output/Total.DTA`
- `Code/02_R_Master.R` — script maestro de la etapa en R: carga paquetes, verifica insumos y ejecuta el análisis
- `Code/03_Gini-Theil.R` — cálculo de los índices de desigualdad
- `Data/` — microdatos de entrada (no versionados)
- `Temp/` — archivos intermedios que genera Stata (no versionados; se crea sola)
- `Output/` — base consolidada y resultados

## Cómo ejecutar

El pipeline usa dos lenguajes y debe ejecutarse en este orden.

1. Descargar los microdatos de la GEIH y ubicarlos en `Data/` con los nombres indicados arriba.
2. Abrir `Code/01_GEIH.do` en Stata y ajustar la ruta del `global root` de la línea 15 a la ubicación del repositorio en tu equipo. Ejecutar. Genera `Output/Total.DTA`.
3. Abrir el archivo `.Rproj` de la raíz y ejecutar `Code/02_R_Master.R`. Genera `Output/Datos.xlsx` con todos los índices.

## Requisitos

- Stata 17 o superior
- R 4.4.2 o superior. Paquetes: haven, dplyr, ineq, DescTools, openxlsx, concstats.

## Autor

Jose Manuel Ordoñez Claros —
[ORCID 0009-0000-3332-1087](https://orcid.org/0009-0000-3332-1087)