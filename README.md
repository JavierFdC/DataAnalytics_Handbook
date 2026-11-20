# Data Analytics Handbook

Material del **Curso de Data Analytics**: desde los fundamentos del análisis de datos hasta el desarrollo de dashboards profesionales, pasando por SQL, Python, estadística, inteligencia artificial y gobierno del dato.

El repositorio sirve como material de clase y como manual de consulta: cada sesión incluye sus apuntes y una sección **para profundizar** con contenido que va más allá de la hora de clase.

---

## Estructura del curso

El curso tiene **9 bloques** y **80 sesiones de 1 hora**, más un **bloque 0** de preparación previa y un **proyecto final** de trabajo autónomo para evaluar el curso. Cada sesión se identifica con el código `bloque.subbloque.sesión` (por ejemplo, `7.2.3`).

| Bloque | Contenido | Caso | Sesiones |
|:---:|---|---|:---:|
| 0 | Puesta a punto | Tu repositorio de portfolio | Trabajo previo |
| 1 | Fundamentos de Data Analytics | Café Lumen, cadena de cafeterías | 3 |
| 2 | SQL y bases de datos | Casa Olivo, tienda online de hogar | 6 |
| 3 | Python para Data Analytics | Pedalia, bicicleta compartida | 19 |
| 4 | Algoritmos, IA y Data Science | *Por definir* | 7 |
| 5 | Arquitectura, cloud y gobierno del dato | *Por definir* | 6 |
| 6 | Excel y dashboarding | *Por definir* | 4 |
| 7 | Power BI | *Por definir* | 15 |
| 8 | Tableau | *Por definir* | 10 |
| 9 | Qlik Sense | *Por definir* | 10 |
| ★ | Proyecto final | *Por definir* | Trabajo autónomo |
| | **Total** | | **80** |

En cada bloque se trabaja con un dataset distinto, para ver problemas y dominios de negocio diferentes a lo largo del curso.

### Cómo seguir el curso

1. **Antes de la primera clase, completa el bloque 0.** Deja instaladas las herramientas (terminal, Git, VS Code, Python y PostgreSQL) y crea tu repositorio `mi-portfolio-data-analytics`, donde guardarás todas las prácticas.
2. **En cada sesión, lee la guía y haz la práctica.** La guía explica los conceptos sobre el caso del bloque, y la práctica se guarda en tu portfolio, en `practicas/bloque-XX/`. Al terminarla, compárala con su archivo resuelto, que está junto a la guía.
3. **Después, resuelve los ejercicios.** Están al final de cada guía, con sus soluciones. Desde el bloque 3, cada sesión trae además un cuaderno `<sesión> - Ejercicios.ipynb` para resolverlos en Jupyter.
4. **Al terminar cada subbloque, haz su [autoevaluación](https://javierfdc.github.io/DataAnalytics_Handbook/Recursos/autoevaluaciones/).** Son diez preguntas que se corrigen al momento y cambian en cada intento. Si fallas alguna, la corrección te dice qué sesión repasar.
5. **Consulta el [glosario](Recursos/Glosario.md) cuando te encuentres un término que no recuerdes.** Cada definición enlaza con la sesión donde se explica.
6. **Al terminar los nueve bloques, haz el proyecto final.** Reúne todo el curso en un único caso de negocio y sirve para evaluarlo.

---

## Bloque 0 — Puesta a punto

*Preparación de entornos previo al curso. Contenidos que se dan por conocidos desde la primera sesión.*

**0.1 Herramientas del curso**

- `0.1.1` [Terminal básica](Bloque%200%20-%20Puesta%20a%20punto/0.1%20-%20Herramientas%20del%20curso/0.1.1%20-%20Terminal%20básica.md)
- `0.1.2` [Git y GitHub: repositorios, commits, ramas y pull requests](Bloque%200%20-%20Puesta%20a%20punto/0.1%20-%20Herramientas%20del%20curso/0.1.2%20-%20Git%20y%20GitHub.md)
- `0.1.3` [VS Code: extensiones y configuración](Bloque%200%20-%20Puesta%20a%20punto/0.1%20-%20Herramientas%20del%20curso/0.1.3%20-%20VS%20Code.md)
- `0.1.4` [Markdown para documentar](Bloque%200%20-%20Puesta%20a%20punto/0.1%20-%20Herramientas%20del%20curso/0.1.4%20-%20Markdown%20para%20documentar.md)
- `0.1.5` [Instalación: Python (entornos virtuales), PostgreSQL y pgAdmin](Bloque%200%20-%20Puesta%20a%20punto/0.1%20-%20Herramientas%20del%20curso/0.1.5%20-%20Instalación%20de%20Python,%20PostgreSQL%20y%20pgAdmin.md)

A lo largo del bloque, cada alumno construye su repositorio `mi-portfolio-data-analytics`, que usará para entregar las prácticas del curso.

---

## Bloque 1 — Fundamentos de Data Analytics

*Qué hace un analista de datos, cómo es el ciclo de vida del dato y el vocabulario básico (variables, dimensiones, medidas y KPIs) que usaremos en el resto del curso.*

**1.1 Fundamentos**

- `1.1.1` [Presentación del curso: ecosistema y ciclo de vida del dato](Bloque%201%20-%20Fundamentos%20de%20Data%20Analytics/1.1%20-%20Fundamentos/1.1.1%20-%20Presentación%20del%20curso,%20ecosistema%20y%20ciclo%20de%20vida%20del%20dato.md)
- `1.1.2` [Variables, dimensiones, medidas y KPIs](Bloque%201%20-%20Fundamentos%20de%20Data%20Analytics/1.1%20-%20Fundamentos/1.1.2%20-%20Variables,%20dimensiones,%20medidas%20y%20KPIs.md)
- `1.1.3` [Tipos de análisis: descriptivo, diagnóstico, predictivo y prescriptivo](Bloque%201%20-%20Fundamentos%20de%20Data%20Analytics/1.1%20-%20Fundamentos/1.1.3%20-%20Tipos%20de%20análisis.md)

Caso del bloque: **Café Lumen**, una cadena de cuatro cafeterías, con sus ventas del primer semestre de 2025 ([`1.0 - Dataset`](Bloque%201%20-%20Fundamentos%20de%20Data%20Analytics/1.0%20-%20Dataset/)).

---

## Bloque 2 — SQL y bases de datos

*Consultar una base de datos relacional con SQL: desde un `SELECT` sencillo hasta subconsultas, CTEs y funciones de ventana para responder preguntas de negocio.*

**2.1 Consultas básicas**

- `2.1.1` [Modelo relacional, SELECT, FROM, WHERE y AS](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.1%20-%20Consultas%20básicas/2.1.1%20-%20Modelo%20relacional,%20SELECT,%20FROM,%20WHERE%20y%20AS.md)
- `2.1.2` [Agregaciones, agrupación y ordenación (GROUP BY, HAVING, ORDER BY)](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.1%20-%20Consultas%20básicas/2.1.2%20-%20Agregaciones,%20agrupación%20y%20ordenación.md)
- `2.1.3` [JOINs y teoría de conjuntos](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.1%20-%20Consultas%20básicas/2.1.3%20-%20JOINs%20y%20teoría%20de%20conjuntos.md)

**2.2 SQL intermedio**

- `2.2.1` [Subconsultas](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.2%20-%20SQL%20intermedio/2.2.1%20-%20Subconsultas.md)
- `2.2.2` [Vistas y CTEs](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.2%20-%20SQL%20intermedio/2.2.2%20-%20Vistas%20y%20CTEs.md)
- `2.2.3` [Funciones de ventana y práctica guiada](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.2%20-%20SQL%20intermedio/2.2.3%20-%20Funciones%20de%20ventana%20y%20práctica%20guiada.md)

Caso del bloque: **Casa Olivo**, una tienda online de artículos para el hogar, con su base de datos desde la apertura (marzo de 2024) hasta diciembre de 2025, en dos scripts SQL ([`2.0 - Dataset`](Bloque%202%20-%20SQL%20y%20bases%20de%20datos/2.0%20-%20Dataset/)).

---

## Bloque 3 — Python para Data Analytics

*Programar en Python para analizar datos: el lenguaje, Pandas para limpiar, transformar y combinar datos, la conexión con SQL, la visualización y la estadística aplicada.*

**3.1 Sintaxis y estructuras de datos**

- `3.1.1` [Entorno, tipos de datos y operadores](Bloque%203%20-%20Python%20para%20Data%20Analytics/3.1%20-%20Sintaxis%20y%20estructuras%20de%20datos/3.1.1%20-%20Entorno,%20tipos%20de%20datos%20y%20operadores.md)
- `3.1.2` [Strings, listas, tuplas, diccionarios y sets](Bloque%203%20-%20Python%20para%20Data%20Analytics/3.1%20-%20Sintaxis%20y%20estructuras%20de%20datos/3.1.2%20-%20Strings,%20listas,%20tuplas,%20diccionarios%20y%20sets.md)
- `3.1.3` [Control de flujo, bucles, range, enumerate, zip y comprehensions](Bloque%203%20-%20Python%20para%20Data%20Analytics/3.1%20-%20Sintaxis%20y%20estructuras%20de%20datos/3.1.3%20-%20Control%20de%20flujo,%20bucles%20y%20comprehensions.md)

**3.2 Funciones y objetos**

- `3.2.1` [Funciones, parámetros, valores por defecto y manejo de errores](Bloque%203%20-%20Python%20para%20Data%20Analytics/3.2%20-%20Funciones%20y%20objetos/3.2.1%20-%20Funciones,%20parámetros,%20valores%20por%20defecto%20y%20manejo%20de%20errores.md)
- `3.2.2` [args, kwargs, lambdas y módulos](Bloque%203%20-%20Python%20para%20Data%20Analytics/3.2%20-%20Funciones%20y%20objetos/3.2.2%20-%20args,%20kwargs,%20lambdas%20y%20módulos.md)
- `3.2.3` [POO aplicada: clases, herencia y polimorfismo](Bloque%203%20-%20Python%20para%20Data%20Analytics/3.2%20-%20Funciones%20y%20objetos/3.2.3%20-%20Clases,%20herencia%20y%20polimorfismo.md)

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

Caso del bloque: **Pedalia**, el servicio de bicicleta compartida de una ciudad española de tamaño medio, con sus estaciones, viajes y tarifas. Las prácticas se hacen en notebooks de Jupyter dentro del portfolio.

---

## Bloque 4 — Algoritmos, IA y Data Science

*Cómo resuelve problemas un ordenador y cómo aprende de los datos: algoritmos de búsqueda, modelos de machine learning con scikit-learn y el uso de la IA generativa en el día a día del analista.*

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

*Dónde viven los datos en una empresa y cómo se gestionan: data warehouse, data lake y cloud, y el gobierno del dato (calidad, metadatos y privacidad).*

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

*Excel como herramienta de análisis: funciones clave, tablas dinámicas y gráficos, hasta construir un dashboard completo.*

**6.1 Excel**

- `6.1.1` Funciones clave: BUSCARX, lógicas, texto y fechas
- `6.1.2` Tablas dinámicas
- `6.1.3` Gráficos, segmentadores y KPIs
- `6.1.4` Dashboard completo en Excel

---

## Bloque 7 — Power BI

*Construir informes profesionales con Power BI: carga y transformación con Power Query, modelado, DAX, diseño interactivo y publicación en Power BI Service.*

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

*Análisis visual con Tableau: preparación de datos, cálculos y LOD, mapas, dashboards interactivos y publicación.*

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

*Aplicaciones analíticas con Qlik Sense: script de carga, modelo asociativo, Set Analysis, cargas incrementales con QVDs, seguridad y publicación en Qlik Cloud.*

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

- **[Autoevaluaciones](https://javierfdc.github.io/DataAnalytics_Handbook/Recursos/autoevaluaciones/)**: una por subbloque, para comprobar si dominas lo visto antes de seguir. Se hacen en el navegador, se corrigen al momento y cada intento trae preguntas distintas. Cada corrección enlaza con la sesión que conviene repasar.
- **[Glosario](Recursos/Glosario.md)**: definiciones breves de los términos del curso, agrupadas por bloque y con enlace a la sesión donde se explica cada uno. Crece a medida que avanza el curso.
- **[Certificaciones profesionales](Recursos/Certificaciones%20profesionales.md)**: las certificaciones oficiales del mercado que se corresponden con cada bloque del curso (SQL, Python, cloud, IA, gobierno del dato, Power BI, Tableau y Qlik). Incluye precios, formato del examen, vigencia y el orden recomendado para certificarse.

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
├── LICENSE                                           ← texto legal de la licencia CC BY-NC-SA 4.0
├── Recursos/                                         ← glosario, certificaciones y autoevaluaciones
├── Bloque 0 - Puesta a punto/
│   └── 0.1 - Herramientas del curso/                 ← sesiones 0.1.x
├── Bloque 1 - Fundamentos de Data Analytics/
│   ├── 1.0 - Dataset/                                ← CSV de Café Lumen
│   └── 1.1 - Fundamentos/                            ← sesiones 1.1.x y sus resueltos
├── Bloque 2 - SQL y bases de datos/
│   ├── 2.0 - Dataset/                                ← scripts SQL de Casa Olivo
│   ├── 2.1 - Consultas básicas/                      ← sesiones 2.1.x y sus resueltos
│   └── 2.2 - SQL intermedio/                         ← sesiones 2.2.x y sus resueltos
├── Bloque 3 - Python para Data Analytics/
│   ├── 3.1 - Sintaxis y estructuras de datos/        ← sesiones 3.1.x, resueltos y cuadernos de ejercicios
│   └── 3.2 - Funciones y objetos/                    ← sesiones 3.2.x, resueltos y cuadernos de ejercicios
├── Bloque 4 - Algoritmos, IA y Data Science/
├── Bloque 5 - Arquitectura, cloud y gobierno del dato/
├── Bloque 6 - Excel y dashboarding/
├── Bloque 7 - Power BI/
├── Bloque 8 - Tableau/
├── Bloque 9 - Qlik Sense/
└── Proyecto final/
```

Cada bloque tiene una carpeta con su nombre. Dentro hay una carpeta por subbloque y, si el bloque tiene datos propios, una carpeta `<bloque>.0 - Dataset`, que aparece la primera.

Cada sesión es un archivo `.md` con esta estructura:

- **Introducción y objetivos**: de qué trata la sesión y qué sabrás hacer al terminarla.
- **Contenidos**: la explicación, con ejemplos sobre el caso del bloque.
- **Práctica**: aplica la sesión al caso del bloque, paso a paso y siguiendo la guía. Su resultado se guarda en el portfolio (`practicas/bloque-XX/`) y va respondiendo al encargo del caso.
- **Ejercicios**: problemas cortos e independientes para comprobar, sin ayuda, que se ha entendido cada concepto. La solución está oculta debajo de cada uno, para mirarla después de intentarlo.
- **Lo que hay por debajo** y **Errores comunes**: cómo funciona por dentro lo que hemos usado y cómo resolver los fallos habituales.
- **Conclusión**: un resumen de lo aprendido y de lo que viene en la siguiente sesión.
- **Para profundizar** y **Recursos**: casos avanzados, documentación oficial y lecturas recomendadas.

Además, cada sesión trae dos archivos junto a su guía:

- **Práctica resuelta** (`<caso>_<sesión>_resuelto`, desde el bloque 1): la práctica terminada, para comparar con la tuya. Las cifras deberían coincidir; la redacción puede ser distinta.
- **Cuaderno de ejercicios** (`<sesión> - Ejercicios.ipynb`, desde el bloque 3): los ejercicios de la guía, listos para resolver en Jupyter. Trae los datos y el resultado esperado, pero no las soluciones.

---

## Autoría y licencia

Handbook creado y mantenido por **Javier Fernández de Cara** ([@JavierFdC](https://github.com/JavierFdC)). © 2026 Javier Fernández de Cara.

Los casos del curso (Café Lumen, Casa Olivo, Pedalia…) son empresas inventadas, y sus datos se han generado para el curso.

Este material se publica con la licencia [Creative Commons Reconocimiento-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es). Puedes copiarlo, adaptarlo y compartirlo para fines no comerciales, siempre que cites la autoría y compartas tus cambios con la misma licencia. El texto legal completo está en el archivo [LICENSE](LICENSE).
