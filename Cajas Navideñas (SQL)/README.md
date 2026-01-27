# 📦 Arquitectura de Datos: Gestión Logística "Cajas Navideñas"

Diseño e implementación de una **base de datos relacional robusta** para automatizar la distribución de beneficios corporativos. El sistema integra la gestión de empleados, estructuras geográficas y procesos de facturación en **Microsoft SQL Server**.

## 🛠️ Proceso de Diseño e Ingeniería
El proyecto se desarrolló bajo un flujo de trabajo profesional utilizando **SAP PowerDesigner** para garantizar la escalabilidad.

### 1. Modelado Conceptual (CDM)
Se definió la lógica de negocio identificando tres pilares clave:
*   **Logística:** Jerarquía geográfica (Región > Ciudad > Comuna).
*   **Capital Humano:** Vinculación de empleados con sucursales y sindicatos.
*   **Comercial:** Gestión de cajas, facturas y medios de pago.

### 2. Modelado Físico (PDM)
Transformación técnica optimizada para el motor de base de datos:
*   **Normalización:** Aplicación de formas normales para eliminar redundancia.
*   **Integridad Referencial:** Diseño estricto de llaves primarias (PK) y foráneas (FK).
*   **Tipado de Datos:** Definición precisa de tipos (int, char, varchar) para optimizar el almacenamiento.

## 🚀 Implementación Técnica (T-SQL)
El despliegue se realizó mediante scripts de Transact-SQL con capacidades avanzadas:
*   **Idempotencia:** Uso de bloques `IF EXISTS` para despliegues repetibles y seguros.
*   **Optimización:** Índices No Agrupados en FK para acelerar los *joins* en reportes.
*   **Seguridad:** Restricciones de integridad que impiden facturaciones inconsistentes.

## 📈 Capacidades del Sistema
*   **Trazabilidad 360°:** Rastreo completo desde el empleado hasta la factura y sucursal.
*   **Reportabilidad:** Estadísticas geográficas segmentadas inmediatas.
*   **Escalabilidad:** Permite añadir nuevos productos sin reestructurar el modelo base.

## 💻 Stack Tecnológico
| Área | Herramienta / Lenguaje |
| :--- | :--- |
| **Modelado** | SAP PowerDesigner |
| **Motor de BD** | Microsoft SQL Server / SSMS |
| **Lenguaje** | T-SQL (Transact-SQL) |

---
