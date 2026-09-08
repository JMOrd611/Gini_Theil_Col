# =====================================================================
# 02_R_Master.R
# Script maestro de la etapa en R.
# Requiere haber ejecutado antes Code/01_GEIH.do
#
# Abrir mediante el archivo .Rproj de la raiz del repositorio.
# No usar setwd(): el proyecto fija el directorio de trabajo.
#
# Fuente: Departamento Administrativo Nacional de Estadistica:
# www.dane.gov.co
# =====================================================================
 
rm(list = ls())
set.seed(2025)
 
# --- Rutas relativas a la raiz del proyecto --------------------------
dir_data   <- "Data"
dir_output <- "Output"
 
# --- Paquetes --------------------------------------------------------
paquetes <- c("haven", "dplyr", "ineq", "DescTools", "openxlsx", "concstats")
faltantes <- paquetes[!paquetes %in% installed.packages()[, "Package"]]
if (length(faltantes) > 0) install.packages(faltantes)
invisible(lapply(paquetes, library, character.only = TRUE))
 
# --- Verificacion de insumos ----------------------------------------
archivo_total <- file.path(dir_output, "Total.DTA")
if (!file.exists(archivo_total)) {
  stop("Falta Output/Total.DTA. Ejecute primero Code/01_GEIH.do")
}
 
# --- Ejecucion -------------------------------------------------------
source(file.path("Code", "03_Gini-Theil.R"))
 
message("Listo. Resultados en ", dir_output)