# 💧 Predicción de Potabilidad del Agua mediante Modelado Multivariante

Este proyecto presenta un análisis exhaustivo sobre la calidad del agua utilizando un dataset de **3,276 muestras**. El reto principal consistió en determinar la potabilidad del agua basándose en parámetros químicos estándar, enfrentando un problema donde las reglas simples de la estadística tradicional no son suficientes.

## 📋 Resumen del Problema
¿Es posible predecir si el agua es apta para el consumo humano analizando solo sus componentes químicos? Este estudio demuestra que, aunque no existan indicadores únicos determinantes, la combinación de variables a través de **Inteligencia Artificial** permite alcanzar un alto grado de certeza.

## 🔍 Análisis Exploratorio y Hallazgos Críticos

### 1. El Desafío de la Independencia Lineal
Al generar la **Matriz de Correlación**, se descubrió que las variables (pH, dureza, sulfatos, cloraminas, etc.) se comportan de forma independiente.
*   **Correlaciones cercanas a 0:** No hay una dependencia lineal clara; por ejemplo, un aumento en el pH no implica necesariamente un cambio en la dureza.
*   **Ausencia de "Variable Mágica":** Ninguna medición individual correlaciona fuertemente con la potabilidad. Ser potable depende de una "receta compleja" de todos los factores.

### 2. Visualización: El Fenómeno del Solapamiento
A través de gráficos de dispersión (*scatter plots*) analizando pH vs. Dureza y Cloraminas, se observó que los puntos de agua potable (naranja) y no potable (azul) están **totalmente mezclados**.
*   **Insight clave:** Un agua con pH neutro (7.0) y niveles de cloraminas dentro de la norma puede seguir siendo no potable. La seguridad del agua es un problema **multivariante** que no se resuelve con umbrales simples.

## 🤖 Modelado con Machine Learning
Debido a que el ojo humano y la estadística descriptiva solo ven una "nube" de puntos solapados, se implementaron algoritmos de aprendizaje supervisado para identificar patrones ocultos.

### Comparativa de Rendimiento de Modelos
Los modelos de **ensamble** fueron los que mejor capturaron la complejidad de los datos:

| Algoritmo | Precisión (Accuracy) | Interpretación Técnica |
| :--- | :--- | :--- |
| **Random Forest** | **89%** | **El más robusto.** Ideal para manejar relaciones no lineales complejas. |
| **Bagging** | **89%** | Proporcionó una excelente estabilidad en las predicciones. |
| **KNN** | **85%** | Clasifica eficazmente basándose en la proximidad de muestras similares. |
| **XGBoost** | **80%** | Presentó menor precisión en este caso específico frente a los ensambles clásicos. |

## 💡 Conclusiones y Futuro
El estudio concluye que, si bien la potabilidad es un fenómeno complejo, el modelo **Random Forest** permite predecir con un **89% de acierto** si el agua es segura para el consumo analizando todas las variables en conjunto.

Este tipo de modelos sienta las bases para el desarrollo de **sensores inteligentes** que podrían monitorear la calidad del agua en tiempo real, automatizando la seguridad hídrica a gran escala.

---
