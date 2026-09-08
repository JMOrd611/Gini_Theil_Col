# Desigualdad salarial en Colombia: una desagregación departamental

Código de la ponencia presentada en el IV Network de Métodos Cuantitativos (AFADECO, Barranquilla, 2025).

## Datos
Gran Encuesta Integrada de Hogares (GEIH), 2020-2025. Microdatos públicos disponibles en el [catálogo del DANE](https://microdatos.dane.gov.co/index.php/catalog/MERCLAB-Microdatos).

Los microdatos originales no se incluyen en este repositorio.
Descárgalos y ubícalos en `Data/`.

Fuente: Departamento Administrativo Nacional de Estadística:
www.dane.gov.co

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
- Stata 17 
- R - Paquetes: haven, dplyr, ineq, ggplot2
## Autor
Jose Manuel Ordoñez Claros — [ORCID](https://orcid.org/0009-0000-3332-1087) 