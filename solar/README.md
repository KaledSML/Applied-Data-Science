# ☀️ ANÁLISIS DE PREDICCIÓN SOLAR: Optimización de Energía Renovable

Este proyecto de **Machine Learning** se enfoca en predecir la radiación solar utilizando un conjunto de datos meteorológicos de **32,686 registros**. El objetivo es desarrollar modelos de regresión avanzados para optimizar la eficiencia de los parques solares y la captación de energía.

## 🔍 Análisis Exploratorio de Datos (EDA)

El estudio de las interdependencias del sistema reveló relaciones clave para el modelo predictivo.

### Matriz de Correlación: Hallazgos Críticos
*   **Correlación Crítica:** La **temperatura** presenta la relación lineal más fuerte con la radiación, siendo el indicador más fiable para el modelo.
*   **Independencia Atmosférica:** Factores como la presión y la velocidad del viento muestran una dependencia débil, comportándose de forma casi autónoma respecto a la radiación inmediata.
*   **Relación Inversa:** Se confirmó que la **humedad** actúa como un factor limitante; a mayor humedad, la radiación tiende a disminuir debido a la dispersión atmosférica.

### Análisis Visual: Ciclos y Tendencias
El análisis de series temporales identificó patrones cíclicos claros.
*   **Comportamiento Cíclico Diario:** La radiación sigue una curva tipo campana de Gauss, con picos superiores a los $600 \, W/m^{2}$ entre las 11:00 h y 13:00 h.
*   **"Desfase Térmico":** Aunque la radiación es máxima al mediodía, la temperatura alcanza su pico horas después. Esto confirma que la seguridad energética depende de una lectura multivariante y no solo del calor ambiental.

## 🤖 Inteligencia Artificial y Modelado Predictivo
Dado que la variabilidad climática presenta patrones complejos, se recurrió a algoritmos de Machine Learning. El modelo de "ensamble" **Random Forest** fue el más exitoso.

### Comparativa de Rendimiento de Modelos
| Modelo de IA | Eficacia | Métrica (MSE) | Interpretación |
| :--- | :--- | :--- | :--- |
| **Random Forest** | **93.6%** | $6417.25$ | El más robusto; ideal para datos climáticos complejos. |
| **Varianza Explicada** | $93.6\%$ | N/A | Excelente capacidad para capturar cambios bruscos. |

## 💡 Conclusión y Aplicaciones
El análisis demuestra que la radiación solar puede determinarse con una alta fiabilidad analizando el conjunto de variables en su totalidad.

Gracias al uso de **Random Forest**, se logró predecir la disponibilidad energética con un **93.6% de certeza** utilizando solo tres parámetros clave: **Temperatura**, **Día del Año** y **Hora**.

Este modelo sugiere que la implementación de sensores inteligentes basados en estos algoritmos permitiría gestionar microrredes eléctricas en tiempo real con una eficiencia superior.

---
