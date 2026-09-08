# =====================================================================
# Script maestro (etapa R). Requiere haber corrido antes 01_GEIH.do
#
# Fuente: Departamento Administrativo Nacional de Estadística:
# www.dane.gov.co
# =====================================================================

# --- Configuración ---------------------------------------------------
rm(list = ls())
set.seed(2025)

# Rutas relativas a la raíz del proyecto
dir_output <- "Output"

# --- Paquetes --------------------------------------------------------
paquetes <- c("haven", "dplyr", "ineq", "ggplot2")
faltantes <- paquetes[!paquetes %in% installed.packages()[, "Package"]]
if (length(faltantes) > 0) install.packages(faltantes)
invisible(lapply(paquetes, library, character.only = TRUE))

# --- Verificación de insumos ----------------------------------------
if (!file.exists(file.path(dir_output, "Total.DTA"))) {
  stop("Falta Total.DTA. Ejecute primero Code/01_GEIH.do")
}

# --- Ejecución -------------------------------------------------------
source("Code/02_gini_theil.R")

message("Listo. Resultados en ", dir_output)