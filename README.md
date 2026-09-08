Desigualdad salarial en Colombia: una desagregación departamental

Código de la ponencia presentada en el IV Network de Métodos Cuantitativos (AFADECO, Barranquilla, 2025).

## Datos
Gran Encuesta Integrada de Hogares 2020-2025 descargables [aquí](https://microdatos.dane.gov.co/index.php/catalog/MERCLAB-Microdatos). 
Los datos no se incluyen en este repositorio; descárgalos y ubícalos en `Data/`.

## Estructura
- `Code/00_R_Master.R` — ejecuta el código de R
- `Code/01_GEIH.do` — realiza el limpiado de base de datos de la GEIH. Al final genera el archivo "Total.DTA" de `Output/`.
- `Code/02_Gini-Theil.R` — cálculo de índices de Gini y Theil a nivel subnacional
- `Data/` — datos de entrada (descargar directamente del DANE)
- `Output/` — tablas, figuras y archivos generados

## Cómo ejecutar
1. Descargar los datos y ubicarlos en `Data/`
2. Abrir el proyecto y ejecutar `Code/01_GEIH.do`
3. Usar el archivo final del paso anterior (Igual a `Output/Total.DTA`) y ejecutar `Code/00_R_Master.R`.

## Requisitos
R - Stata
## Autor
Jose Manuel Ordoñez Claros — [ORCID](https://orcid.org/0009-0000-3332-1087) 