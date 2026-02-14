# ==========================================================
# ☀️ PREDICCIÓN SOLAR: VERSIÓN R 
# ==========================================================

# --- 1. HERRAMIENTAS ---
library(tidyverse) # Limpieza y gráficos (ggplot2)
library(tidymodels) # Machine Learning profesional
library(readxl)    # Lector de Excel
library(ranger)    # Motor rápido de Random Forest
library(reshape2)  # Para la matriz de correlación

# --- 2. CARGA DE DATOS ---
dataset <- read_excel("SolarPrediction.xlsx")

# --- 3. VISUALIZACIÓN DE BARRAS (EDA) ---
# Replicando tus gráficos de colores por intensidad
dataset %>%
  group_by(MonthOfYear) %>%
  summarise(Mean_Radiation = mean(Radiation)) %>%
  ggplot(aes(x = factor(MonthOfYear), y = Mean_Radiation, fill = Mean_Radiation)) +
  geom_col() +
  scale_fill_gradient(low = "yellow", high = "red") +
  labs(title = "Radiación Media por Mes", x = "Mes", y = "Radiación") +
  theme_minimal()

# --- 4. MATRIZ DE CORRELACIÓN ---
cor_data <- dataset %>% 
  select(Radiation, Temperature, Pressure, Humidity, `WindDirection(Degrees)`, Speed) %>%
  cor()

melt(cor_data) %>%
  ggplot(aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# --- 5. ENTRENAMIENTO (TOP 3 VARIABLES) ---
# Usamos las ganadoras de tu Python: Temp, DayOfYear y TimeOfDay(s)
set.seed(0)
solar_split <- initial_split(dataset, prop = 0.8)
train_data <- training(solar_split)
test_data  <- testing(solar_split)

# Definimos el modelo de Regresión
rf_spec <- rand_forest(trees = 100) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")

# La "Receta" con las variables seleccionadas
solar_recipe <- recipe(Radiation ~ Temperature + DayOfYear + `TimeOfDay(s)`, data = train_data)

# Unimos todo en un flujo (Workflow)
solar_wf <- workflow() %>%
  add_recipe(solar_recipe) %>%
  add_model(rf_spec)

# Ajuste final
final_model <- fit(solar_wf, train_data)

# --- 6. EXAMEN FINAL (MÉTRICAS) ---
# Aquí verás el RSQ (R2) y el RMSE
results <- test_data %>%
  bind_cols(predict(final_model, test_data)) %>%
  metrics(truth = Radiation, estimate = .pred)

print(results)

# --- 7. GRÁFICO DE PREDICCIÓN (MUESTRA 600) ---
# Línea negra (real) vs Línea roja (IA)
plot_data <- dataset %>%
  slice(1:600) %>%
  bind_cols(predict(final_model, dataset %>% slice(1:600)))

ggplot(plot_data) +
  geom_line(aes(x = 1:600, y = Radiation, color = "Real")) +
  geom_line(aes(x = 1:600, y = .pred, color = "IA"), linetype = "dashed") +
  scale_color_manual(values = c("Real" = "black", "IA" = "red")) +
  labs(title = "Predicciones Solar Irradiance (R)", x = "Tiempo", y = "Radiación") +
  theme_minimal()
