# 🌸 Análisis y Clasificación del Dataset Iris con Scikit-Learn

Este proyecto documenta mi primer desarrollo en ciencia de datos, utilizando el conjunto de datos **Iris**, un estándar en la industria para problemas de clasificación. El objetivo es automatizar la identificación de tres especies (*Setosa, Versicolor y Virginica*) basándose en sus medidas físicas.

## 📊 Análisis Exploratorio de Datos (EDA)
El dataset consta de 150 registros con cuatro variables predictoras.

*   **Integridad de los datos:** Mediante `df.info()`, se confirmó que el dataset está limpio, con **0 valores nulos**.
*   **Balance de clases:** Utilizando `value_counts()`, se verificó un equilibrio perfecto (50 muestras por especie), lo que garantiza que los modelos no tengan sesgos hacia una categoría específica.
*   **Análisis Estadístico:** El comando `df.describe()` reveló que la **longitud del pétalo** tiene la mayor desviación estándar ($1.76$), lo que indica que es la variable con mayor poder de separación entre especies.

## 🛠️ Metodología y Modelado
Para que los algoritmos de Scikit-learn procesaran la variable objetivo `type`, se aplicó una técnica de **codificación de etiquetas (Label Encoding)**. Esto transformó las categorías textuales en valores numéricos ($0, 1, 2$), permitiendo el cálculo matemático de los modelos.

Se implementaron tres enfoques distintos para comparar su efectividad:

| Algoritmo | Precisión (Accuracy) | Observaciones |
| :--- | :--- | :--- |
| **Árboles de Decisión** | **100%** | Es el modelo más eficaz para este dataset; separa las clases de forma binaria y pura. |
| **Regresión Logística** | **98%** | Demuestra una alta confiabilidad para relaciones lineales entre las variables. |
| **K-Nearest Neighbors (KNN)** | **96.3%** | Identifica similitudes por proximidad, aunque presenta ligeros solapamientos entre Versicolor y Virginica. |

## 💡 Conclusiones e Insights
El análisis permite concluir que las dimensiones de los **pétalos** son rasgos morfológicos significativamente más discriminantes que los sépalos. Este enfoque cuantitativo transforma la taxonomía tradicional en un proceso objetivo, escalable y reproducible para estudios de biodiversidad.

---
