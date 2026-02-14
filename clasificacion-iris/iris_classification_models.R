# ==========================================================
# 🌸 CLASIFICACIÓN IRIS
# ==========================================================

# --- 1. LIBRERÍAS ---
library(tidyverse)  # Para manipular datos (el pandas de R)
library(tidymodels) # Para el Machine Learning
library(readxl)     # Para leer el .xlsx

# --- 2. CARGA Y EXPLORACIÓN ---
# Nota: Usamos el nombre de tu archivo 'iris2.xlsx'
df <- read_excel("iris2.xlsx")

df %>% glimpse()   # Como el df.info()
df %>% summary()   # Como el df.describe()
df %>% count(type) # Como el value_counts()

# --- 3. PREPARACIÓN (LABEL ENCODING) ---
# En R, convertimos a 'factor'. Es el equivalente al LabelEncoder
df <- df %>% 
  mutate(type = as.factor(type))

# --- 4. DIVISIÓN DE DATOS (70/30) ---
set.seed(123) # Para que los resultados no cambien
iris_split <- initial_split(df, prop = 0.7, strata = type)
train_data <- training(iris_split)
test_data  <- testing(iris_split)

# --- 5. DEFINICIÓN DE LOS 3 MODELOS ---

# A. Árbol de Decisión (DecisionTreeClassifier)
tree_spec <- decision_tree() %>% 
  set_engine("rpart") %>% 
  set_mode("classification")

# B. Regresión Logística (LogisticRegression)
lr_spec <- multnom_reg() %>% 
  set_engine("nnet") %>% 
  set_mode("classification")

# C. KNN (KNeighborsClassifier)
knn_spec <- nearest_neighbor() %>% 
  set_engine("kknn") %>% 
  set_mode("classification")

# --- 6. ENTRENAMIENTO (FIT) ---
# Entrenamos los modelos con los datos de práctica
tree_fit <- tree_spec %>% fit(type ~ ., data = train_data)
lr_fit   <- lr_spec   %>% fit(type ~ ., data = train_data)
knn_fit  <- knn_spec  %>% fit(type ~ ., data = train_data)

# --- 7. PREDICCIÓN Y PRECISIÓN (ACCURACY) ---
# Creamos una función rápida para evaluar
evaluar <- function(modelo, nombre) {
  predict(modelo, test_data) %>%
    bind_cols(test_data) %>%
    accuracy(truth = type, estimate = .pred_class) %>%
    mutate(model = nombre)
}

# Comparamos los 3 resultados
resultados <- bind_rows(
  evaluar(tree_fit, "Árbol de Decisión"),
  evaluar(lr_fit, "Regresión Logística"),
  evaluar(knn_fit, "KNN")
)

print(resultados)

# --- 8. MATRIZ DE CONFUSIÓN ---
# Para ver dónde se equivocó el modelo (ejemplo con el Árbol)
predict(tree_fit, test_data) %>%
  bind_cols(test_data) %>%
  conf_mat(truth = type, estimate = .pred_class)
