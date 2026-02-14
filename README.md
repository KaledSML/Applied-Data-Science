# 📊 Data Science & Analytics Portfolio

¡Bienvenido! Este repositorio compila mis desarrollos en el ecosistema de datos. Mi enfoque integra la arquitectura técnica de bases de datos con la potencia del aprendizaje automático.

---

## 🛠️ Tridente Tecnológico

[![SQL](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](#-gestión-logística-cajas-navideñas)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](#-predicción-de-radiación-solar)
[![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)](#-predicción-de-radiación-solar)

---

## 📂 Proyectos Destacados

### ☀️ Predicción de Radiación Solar
> **Optimización Energética:** Modelo de regresión para predecir la irradiación basada en variables meteorológicas.

* **🏆 Resultado:** Precisión del **93.6%** ($R^{2}$) con Random Forest.
* **🛠️ Feature Engineering:** Identificación de Temperatura y Hora como predictores críticos.
* **🌓 Dual Language:** Proyecto validado tanto en **Python** como en **R**.

[![Acceder al Proyecto](https://img.shields.io/badge/ACCEDER_AL_PROYECTO-000000?style=for-the-badge&logo=github&logoColor=white)](./solar-prediction)

---

### 💧 Análisis de Potabilidad del Agua
> **Seguridad Hídrica:** Clasificación multivariante para determinar la aptitud del agua para consumo humano.

* **🎯 Score:** **89%** de acierto mediante modelos de ensamble.
* **🔍 EDA:** Análisis profundo de correlación entre 9 parámetros químicos.
* **🛠️ Stack:** `Pandas`, `Seaborn`, `Scikit-Learn`.

[![Acceder al Proyecto](https://img.shields.io/badge/ACCEDER_AL_PROYECTO-000000?style=for-the-badge&logo=github&logoColor=white)](./agua-quality)

---

### 📦 Gestión Logística "Cajas Navideñas"
> **Arquitectura de Datos:** Diseño e implementación de un sistema transaccional robusto.

* **🏗️ Diseño:** Modelado Conceptual y Físico (CDM/PDM) en **SAP PowerDesigner**.
* **⚡ SQL Pro:** Implementación de **Stored Procedures** y **Vistas** de trazabilidad 360°.
* **🛡️ Integridad:** Lógica de negocio protegida mediante restricciones y normalización.

[![Acceder al Proyecto](https://img.shields.io/badge/ACCEDER_AL_PROYECTO-000000?style=for-the-badge&logo=github&logoColor=white)](./gestion-logistica-sql)

---

### 🌸 Clasificación Botánica Iris
> **Clasificación Taxonómica:** Automatización de identificación de especies vegetales.

* **🥇 Eficacia:** **100% Accuracy** mediante Árboles de Decisión.
* **⚖️ Comparativa:** Evaluación de rendimiento entre KNN, Logística y Árboles.
* **💡 Insight:** Determinación de dimensiones del pétalo como rasgo discriminante.

[![Acceder al Proyecto](https://img.shields.io/badge/ACCEDER_AL_PROYECTO-000000?style=for-the-badge&logo=github&logoColor=white)](./clasificacion-iris)

---

## ⚙️ Metodología

```mermaid
graph LR
  A[📥 Ingesta] --> B[🧹 Limpieza]
  B --> C[📈 EDA]
  C --> D[🤖 Modelado]
  D --> E[🎯 Resultados]
  style E fill:#FFD700,stroke:#333,stroke-width:2px
