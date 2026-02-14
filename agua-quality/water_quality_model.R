# ==========================================================
# 💧 ANÁLISIS DE POTABILIDAD DEL AGUA (VERSIÓN R)
# Ayuda de memoria: Limpieza, Modelado (Random Forest) y Evaluación
# ==========================================================

# --- 1. SET DE HERRAMIENTAS ---
library(tidyverse)  # Limpieza y visualización (el todoterreno)
library(tidymodels) # Machine Learning (el motor principal)
library(readxl)     # Para leer archivos Excel
library(ranger)     # Algoritmo Random Forest
library(vip)        # Ranking de importancia de variables

# --- 2. DATOS Y LIMPIEZA ---
# Carga + quitar nulos + convertir target a factor (categoría)
# Nota: Ajusta el nombre del archivo si es necesario
df <- read_excel("water_potability.xlsx") %>%
  drop_na() %>%
  mutate(Potability = as.factor(Potability)) 

# --- 3. REGLA DE ORO: SEPARAR DATA ---
# Guardamos el 80% para entrenar y 20% para el examen final
set.seed(123)
data_split <- initial_split(df, prop = 0.8, strata = Potability)
train_data <- training(data_split)
test_data  <- testing(data_split)

# --- 4. DEFINIR EL MODELO (EL BOSQUE) ---
# Random Forest: 1000 árboles para promediar opiniones
rf_spec <- rand_forest(
    trees = 1000, 
    mtry = tune(),  # Probar cantidad de variables por nodo
    min_n = tune()  # Probar profundidad del árbol
  ) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("classification")

# --- 5. LA RECETA (PREPROCESADO) ---
# Normalizar: poner todos los químicos en la misma escala (media 0, var 1)
water_recipe <- recipe(Potability ~ ., data = train_data) %>%
  step_normalize(all_numeric_predictors())

# --- 6. ENTRENAMIENTO Y TUNEO (GRID SEARCH) ---
# Unir receta + modelo y buscar los mejores ajustes automáticamente
water_wf <- workflow() %>%
  add_recipe(water_recipe) %>%
  add_model(rf_spec)

set.seed(456)
folds <- vfold_cv(train_data, v = 5) # Validación cruzada (5 vueltas)
tuning_results <- tune_grid(water_wf, resamples = folds, grid = 10)

# --- 7. CIERRE Y EVALUACIÓN FINAL ---
# Elegir mejores parámetros -> Ajuste final -> Probar en test_data
best_params <- select_best(tuning_results, metric = "accuracy")
final_wf <- finalize_workflow(water_wf, best_params)
final_fit <- last_fit(final_wf, data_split)

# --- 8. RESULTADOS Y MÉTRICAS ---
collect_metrics(final_fit) # Ver el Accuracy final (~89%)

# Gráfico rápido de qué químico pesa más en la decisión final
final_fit %>%
  extract_fit_parsnip() %>%
  vip(geom = "point") + 
  theme_minimal() +
  labs(title = "Importancia de Variables en Potabilidad")
