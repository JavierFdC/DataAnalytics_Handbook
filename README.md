# Data Analytics Handbook

Material del **Curso de Data Analytics**: desde los fundamentos del análisis de datos hasta el desarrollo de dashboards profesionales, pasando por SQL, Python, estadística, inteligencia artificial y gobierno del dato.

El repositorio sirve como material de clase y como manual de consulta: cada sesión incluye sus apuntes y una sección **para profundizar** con contenido que va más allá de la hora de clase.

---

## Estructura del curso

El curso tiene **9 bloques** y **80 sesiones de 1 hora**, más un **bloque 0** de preparación previa y un **proyecto final** de trabajo autónomo para evaluar el curso. Cada sesión se identifica con el código `bloque.subbloque.sesión` (por ejemplo, `7.2.3`).

| Bloque | Contenido | Sesiones |
|:---:|---|:---:|
| 0 | Preparación | Trabajo previo |
| 1 | Fundamentos de Data Analytics | 3 |
| 2 | SQL y bases de datos | 6 |
| 3 | Python para análisis de datos | 19 |
| 4 | Algoritmos, IA y Data Science | 7 |
| 5 | Arquitectura, cloud y gobierno del dato | 6 |
| 6 | Excel y dashboarding | 4 |
| 7 | Power BI | 15 |
| 8 | Tableau | 10 |
| 9 | Qlik Sense | 10 |
| ★ | Proyecto final | Trabajo autónomo |
| | **Total** | **80** |

En cada bloque se trabaja con un dataset distinto, para ver problemas y dominios de negocio diferentes a lo largo del curso.

---

<a id="bloque-0--preparacion"></a>

## Bloque 0 — Preparación

*Preparación de entornos previo al curso. Contenidos que se dan por conocidos desde la primera sesión.*

**0.1 Herramientas del curso**

- `0.1.1` [Terminal básica](Bloque%200%20-%20Preparación/0.1.1%20-%20Terminal%20básica.md)
- `0.1.2` [Git y GitHub: repositorios, commits, ramas y pull requests](Bloque%200%20-%20Preparación/0.1.2%20-%20Git%20y%20GitHub.md)
- `0.1.3` [VS Code: extensiones y configuración](Bloque%200%20-%20Preparación/0.1.3%20-%20VS%20Code.md)
- `0.1.4` [Markdown para documentar](Bloque%200%20-%20Preparación/0.1.4%20-%20Markdown%20para%20documentar.md)
- `0.1.5` [Instalación: Python (entornos virtuales), PostgreSQL y pgAdmin](Bloque%200%20-%20Preparación/0.1.5%20-%20Instalación%20de%20Python,%20PostgreSQL%20y%20pgAdmin.md)

A lo largo del bloque, cada alumno construye su repositorio `mi-portfolio-data-analytics`, que usará para entregar las prácticas del curso.

---

## Bloque 1 — Fundamentos de Data Analytics

**1.1 Fundamentos**

- `1.1.1` [Presentación del curso: ecosistema y ciclo de vida del dato](Bloque%201%20-%20Fundamentos/1.1.1%20-%20Presentación%20del%20curso,%20ecosistema%20y%20ciclo%20de%20vida%20del%20dato.md)
- `1.1.2` [Variables, dimensiones, medidas y KPIs](Bloque%201%20-%20Fundamentos/1.1.2%20-%20Variables,%20dimensiones,%20medidas%20y%20KPIs.md)
- `1.1.3` [Tipos de análisis: descriptivo, diagnóstico, predictivo y prescriptivo](Bloque%201%20-%20Fundamentos/1.1.3%20-%20Tipos%20de%20análisis.md)

Caso del bloque: **Café Lumen**, una cadena de cuatro cafeterías, con sus ventas del primer semestre de 2025 ([`dataset/`](Bloque%201%20-%20Fundamentos/dataset/)).

---

## Bloque 2 — SQL y bases de datos

**2.1 Consultas básicas**

- `2.1.1` [Modelo relacional, PostgreSQL y pgAdmin. SELECT, FROM, WHERE y AS](Bloque%202%20-%20SQL/2.1.1%20-%20Modelo%20relacional,%20PostgreSQL%20y%20pgAdmin.%20SELECT,%20FROM,%20WHERE%20y%20AS.md)
- `2.1.2` [Agregaciones, agrupación y ordenación (GROUP BY, HAVING, ORDER BY)](Bloque%202%20-%20SQL/2.1.2%20-%20Agregaciones,%20agrupación%20y%20ordenación.md)
- `2.1.3` [JOINs y teoría de conjuntos](Bloque%202%20-%20SQL/2.1.3%20-%20JOINs%20y%20teoría%20de%20conjuntos.md)

**2.2 SQL intermedio**

- `2.2.1` Subconsultas
- `2.2.2` Vistas y CTEs
- `2.2.3` Funciones de ventana y práctica guiada

Caso del bloque: **Casa Olivo**, una tienda online de artículos para el hogar, con su base de datos desde la apertura (marzo de 2024) hasta diciembre de 2025, en dos scripts SQL ([`dataset/`](Bloque%202%20-%20SQL/dataset/)).

---

## Bloque 3 — Python para análisis de datos

**3.1 Sintaxis y estructuras de datos**

- `3.1.1` Entorno, tipos de datos y operadores
- `3.1.2` Strings, listas, tuplas, diccionarios y sets
- `3.1.3` Control de flujo, bucles, range, enumerate, zip y comprehensions

**3.2 Funciones y objetos**

- `3.2.1` Funciones, parámetros, valores por defecto y manejo de errores
- `3.2.2` args, kwargs, lambdas y módulos
- `3.2.3` POO aplicada: clases, herencia y polimorfismo

**3.3 NumPy y Pandas**

- `3.3.1` NumPy y Pandas esencial: Series, DataFrames, selección y filtrado
- `3.3.2` Limpieza de datos: nulos, duplicados y tipos
- `3.3.3` Transformación de datos y creación de variables

**3.4 Agregación y combinación**

- `3.4.1` groupby, agg y apply
- `3.4.2` Combinación de DataFrames: merge, join y concat
- `3.4.3` Pivot y melt

**3.5 Python, SQL y ETL**

- `3.5.1` Conexión a PostgreSQL desde Python
- `3.5.2` ETL/ELT con Python: diseño y práctica

**3.6 Visualización**

- `3.6.1` Visualización con matplotlib y seaborn
- `3.6.2` Visualización exploratoria: elegir el gráfico adecuado

**3.7 Estadística aplicada**

- `3.7.1` Estadística descriptiva y distribuciones
- `3.7.2` Correlación, outliers y causalidad
- `3.7.3` Muestreo, inferencia y test A/B

---

## Bloque 4 — Algoritmos, IA y Data Science

**4.1 Algoritmos**

- `4.1.1` Algoritmos, grafos y complejidad: cómo «piensa» un ordenador
- `4.1.2` Búsqueda no informada: BFS y DFS
- `4.1.3` Búsqueda informada: Dijkstra y A*

**4.2 Machine Learning**

- `4.2.1` Fundamentos de ML: tipos de aprendizaje, train/test, sobreajuste y métricas
- `4.2.2` Regresión y clasificación con scikit-learn
- `4.2.3` Clustering y segmentación

**4.3 IA generativa**

- `4.3.1` IA generativa y LLMs para analistas: usos, límites y ética

---

## Bloque 5 — Arquitectura, cloud y gobierno del dato

**5.1 Arquitectura y cloud**

- `5.1.1` Arquitectura de datos: data warehouse, data lake y lakehouse
- `5.1.2` Plataformas cloud (AWS, Google Cloud, Azure) y bases de datos en la nube

**5.2 Gobierno del dato**

- `5.2.1` Marco de gobierno: objetivos, roles, Data Hub e integración
- `5.2.2` Calidad del dato
- `5.2.3` Metadatos, catálogo y privacidad (RGPD)
- `5.2.4` Reto guiado: plan de gobierno del dato

---

## Bloque 6 — Excel y dashboarding

**6.1 Excel**

- `6.1.1` Funciones clave: BUSCARX, lógicas, texto y fechas
- `6.1.2` Tablas dinámicas
- `6.1.3` Gráficos, segmentadores y KPIs
- `6.1.4` Dashboard completo en Excel

---

## Bloque 7 — Power BI

**7.1 Fundamentos**

- `7.1.1` Instalación, entorno y conceptos básicos
- `7.1.2` Power Query - Carga y transformación de datos
- `7.1.3` Modelado de datos (dimensiones, relaciones y medidas)
- `7.1.4` DAX básico — medidas, funciones y contexto de filtro
- `7.1.5` Principios de visualización y primer dashboard completo

**7.2 DAX y modelado intermedio**

- `7.2.1` DAX intermedio (CALCULATE, FILTER, ALL)
- `7.2.2` Tabla calendario y Time Intelligence
- `7.2.3` Funciones iteradoras y variables en DAX
- `7.2.4` Modelado avanzado: estrella, snowflake, jerarquías y granularidad

**7.3 Interactividad, diseño y publicación**

- `7.3.1` Segmentadores, filtros y sincronización
- `7.3.2` Field Parameters y Bookmarks
- `7.3.3` Visualizaciones avanzadas
- `7.3.4` Diseño y accesibilidad
- `7.3.5` Power BI Service: publicación, RLS e informes paginados

**7.4 Cierre**

- `7.4.1` Caso integrador: dashboard completo de principio a fin

---

## Bloque 8 — Tableau

**8.1 Fundamentos**

- `8.1.1` Instalación, interfaz y conexión de datos
- `8.1.2` Preparación de datos con Tableau Prep
- `8.1.3` Visualizaciones básicas: barras, líneas y dispersión

**8.2 Cálculos**

- `8.2.1` Campos calculados, cálculos rápidos y de tabla
- `8.2.2` LOD Expressions (FIXED, INCLUDE, EXCLUDE)
- `8.2.3` Parámetros y acciones

**8.3 Dashboards y publicación**

- `8.3.1` Mapas y análisis geoespacial
- `8.3.2` Dashboards interactivos y storytelling
- `8.3.3` Rendimiento, extractos (.hyper) y publicación
- `8.3.4` Proyecto Tableau: dashboard interactivo

---

## Bloque 9 — Qlik Sense

**9.1 Fundamentos**

- `9.1.1` Instalación, entorno y ecosistema Qlik
- `9.1.2` Script de carga: joins, concatenate y resident
- `9.1.3` Modelo asociativo, claves sintéticas y referencias circulares

**9.2 Visualización y análisis**

- `9.2.1` Visualizaciones y elementos maestros
- `9.2.2` Set Analysis: sintaxis y casos
- `9.2.3` Set Analysis avanzado y expresiones

**9.3 Producción**

- `9.3.1` QVDs y cargas incrementales
- `9.3.2` Seguridad: Section Access
- `9.3.3` Qlik Cloud: publicación y espacios
- `9.3.4` Proyecto Qlik: app analítica de negocio

---

## Proyecto final

Proyecto individual que se desarrolla de forma autónoma, fuera de las sesiones. Integra todo el curso sobre un único caso de negocio para evaluar vuestro desempeño.

---

## Material complementario

*Información adicional para el alumno. No forma parte de las sesiones ni de la evaluación del curso.*

- **[Glosario](recursos/Glosario.md)**: definiciones breves de los términos del curso, agrupadas por bloque y con enlace a la sesión donde se explica cada uno. Crece a medida que avanza el curso.
- **[Certificaciones profesionales](recursos/Certificaciones%20profesionales.md)**: las certificaciones oficiales del mercado que se corresponden con cada bloque del curso (SQL, Python, cloud, IA, gobierno del dato, Power BI, Tableau y Qlik). Incluye precios, formato del examen, vigencia y el orden recomendado para certificarse.

---

## Herramientas

| Área | Herramientas |
|---|---|
| Entorno | Git, GitHub, VS Code, Jupyter |
| Bases de datos | PostgreSQL, pgAdmin 4 |
| Python | NumPy, Pandas, Matplotlib, Seaborn, scikit-learn |
| Hojas de cálculo | Excel |
| Business Intelligence | Power BI, Tableau, Qlik Sense |

---

## Organización del repositorio

```
data-analytics-handbook/
├── README.md
├── recursos/                               ← glosario, guías de instalación, cheatsheets, certificaciones
├── Bloque 0 - Preparación/
├── Bloque 1 - Fundamentos/                dataset/
├── Bloque 2 - SQL/                        dataset/
├── Bloque 3 - Python/                     notebooks/  data/
├── Bloque 4 - Algoritmos e IA/            notebooks/  data/
├── Bloque 5 - Arquitectura y gobierno/
├── Bloque 6 - Excel/                      ejercicios/  data/
├── Bloque 7 - Power BI/                   pbix/  data/
├── Bloque 8 - Tableau/                    workbooks/  data/
├── Bloque 9 - Qlik Sense/                 apps/  data/
└── Proyecto final/                        enunciado/  data/
```

Cada carpeta de bloque contiene un archivo `.md` (o notebook) por sesión, con esta estructura:

- **Objetivos** — qué sabrás hacer al terminar la sesión.
- **Contenidos** — la explicación de la sesión.
- **Práctica** — ejercicios sobre el dataset del bloque.
- **Para profundizar** — casos avanzados, documentación oficial y lecturas recomendadas.
- **Recursos** — enlaces y material complementario.
