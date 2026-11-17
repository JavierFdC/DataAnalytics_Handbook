# Glosario del curso

**Material complementario**: definiciones breves de los términos que aparecen en las sesiones, para consultar cuando una palabra no nos suene o queramos repasar un concepto.

[← Volver al índice del curso](../README.md#material-complementario)

---

## Cómo usar este glosario

- Los términos están agrupados **por bloque**, en el bloque donde aparecen por primera vez, y ordenados alfabéticamente dentro de cada uno.
- Entre paréntesis y en cursiva va el término en inglés cuando es el que se usa en la documentación o en las herramientas. Si en la práctica se usa directamente en inglés (*commit*, *pull request*), la entrada está en inglés.
- Al final de cada definición, el enlace lleva a la sesión donde se explica el término a fondo.
- El glosario crece con el curso: cada bloque nuevo añade su sección.

---

## Bloque 0 — Preparación

**Área de preparación** (*staging area*). Zona intermedia de Git donde elegimos qué cambios entrarán en el próximo commit. Se añaden con `git add`. · [0.1.2]

**Cliente y servidor.** Un **servidor** es un programa siempre en marcha que espera peticiones (como PostgreSQL); un **cliente** se conecta a él para enviárselas (como pgAdmin o un script de Python). Pueden estar en el mismo ordenador o en máquinas distintas. · [0.1.5]

**Clonar** (*clone*). Descargar un repositorio existente con todo su historial: `git clone <url>`. · [0.1.2]

**Codificación de caracteres** (*encoding*). Forma de guardar el texto como bytes. **UTF-8** es el estándar actual y representa tildes y eñes correctamente. Si un programa lee un archivo con otra codificación, aparecen caracteres extraños como `CafÃ©`. · [0.1.1], [1.1.1]

**Commit.** Una "foto" del proyecto guardada en el historial de Git, con un identificador único (*hash*), autor, fecha, un mensaje que explica el cambio y una referencia al commit anterior. · [0.1.2]

**CommonMark.** Especificación estándar del núcleo del lenguaje Markdown, creada para resolver las ambigüedades del Markdown original. · [0.1.4]

**Conflicto de fusión** (*merge conflict*). Situación en la que Git no puede fusionar dos ramas automáticamente porque ambas han cambiado las mismas líneas de un archivo. Hay que decidir a mano qué versión se queda. · [0.1.2]

**Control de versiones.** Sistema que guarda el historial de cambios de un proyecto: qué cambió, quién, cuándo y por qué. Permite volver a cualquier versión anterior y trabajar en paralelo sin pisarse. Git es el más usado. · [0.1.2]

**Dependencia.** Librería que otra librería necesita para funcionar. Al instalar pandas, pip instala también NumPy porque pandas depende de ella. · [0.1.5]

**Directorio de trabajo** (*working directory*). Los archivos del repositorio tal y como están ahora en la carpeta, donde los editamos. Es la primera de las tres áreas de Git. · [0.1.2]

**Entorno virtual** (`.venv`). Carpeta dentro de un proyecto con su propia copia de Python y sus propias librerías, aislada del resto del sistema. Un proyecto, un entorno. No se sube a GitHub: se recrea con `requirements.txt`. · [0.1.5]

**`.env`.** Archivo donde se guardan credenciales y variables de entorno (contraseñas, claves de acceso) para que no aparezcan en el código. Siempre va en el `.gitignore`. · [0.1.5]

**Espacio de trabajo** (*workspace*). En VS Code, la carpeta del proyecto abierta. Sus ajustes se guardan en `.vscode/settings.json` y viajan con el repositorio, a diferencia de los ajustes de usuario. · [0.1.3]

**Extensión.** Complemento que añade capacidades a VS Code (soporte de un lenguaje, un visor de archivos, un conector de bases de datos). Se instala desde el *Marketplace*. Ejecuta código en nuestro ordenador, así que conviene comprobar quién la publica. · [0.1.3]

**Fork.** Copia de un repositorio ajeno en nuestra cuenta de GitHub, para proponer cambios mediante un pull request. Es la forma de contribuir a proyectos de código abierto. · [0.1.2]

**Fusionar** (*merge*). Incorporar los commits de una rama en otra, normalmente en `main` al aprobar un pull request. · [0.1.2]

**GFM** (*GitHub Flavored Markdown*). La variante de Markdown de GitHub: CommonMark más tablas, listas de tareas, tachado y otras extensiones. Es la que usamos en el curso y la que entienden VS Code y Jupyter. · [0.1.4]

**Git.** Programa de control de versiones que se instala en el ordenador y gestiona el historial de una carpeta. Funciona sin internet. · [0.1.2]

**GitHub.** Plataforma web que aloja repositorios de Git en la nube y añade colaboración: pull requests, revisión de código, gestión de tareas y un perfil público. Alternativas: GitLab, Bitbucket, Azure DevOps. · [0.1.2]

**`.gitignore`.** Archivo que indica a Git qué archivos y carpetas no debe vigilar nunca: entornos virtuales, archivos temporales, credenciales y datasets grandes. · [0.1.2]

**Hash.** Resultado de aplicar una **función hash** a unos datos: un código de longitud fija que funciona como su huella digital. El mismo contenido produce siempre el mismo hash, el más mínimo cambio produce uno completamente distinto y, a partir del hash, no se puede reconstruir el contenido original. Git calcula así el identificador de cada commit (con el algoritmo SHA-1) y suele mostrar solo sus primeros caracteres, como `a3f5c21`. En análisis de datos también se usa para comprobar que un archivo no ha cambiado o para seudonimizar datos personales. · [0.1.2]

**HTML.** Lenguaje de las páginas web. Todo archivo Markdown se convierte en HTML para mostrarse con formato. · [0.1.4]

**IDE** (*Integrated Development Environment*). Entorno de desarrollo con todo integrado para un lenguaje concreto, como PyCharm o DataGrip. VS Code, con extensiones, se acerca mucho a un IDE. · [0.1.3]

**Intérprete.** El programa de Python que ejecuta nuestro código. En VS Code se elige con *Python: Select Interpreter*; en el curso, siempre el del entorno virtual `.venv`. · [0.1.5]

**JSON.** Formato de texto para datos estructurados, con pares clave-valor entre llaves. VS Code guarda en JSON toda su configuración. · [0.1.3]

**Jupyter.** Entorno de *notebooks*: documentos que mezclan celdas de código ejecutable, sus resultados y celdas de texto en Markdown. Los archivos tienen extensión `.ipynb` y VS Code los abre con su extensión. · [0.1.3]

**Kernel.** En un notebook de Jupyter, el proceso de Python que ejecuta las celdas. Se elige con *Select Kernel*; en el curso, el del entorno `.venv`. · [0.1.5]

**Librería** (o **paquete**). Conjunto de código reutilizable que añade capacidades a Python, como pandas o matplotlib. Se instala con pip. · [0.1.5]

**Línea de comandos** (*CLI, Command Line Interface*). Forma de trabajar con programas mediante comandos de texto, en oposición a la interfaz gráfica (*GUI*) de ventanas y botones. · [0.1.1]

**`localhost`.** Nombre que designa al propio ordenador en una conexión de red. `host="localhost"` significa "el servidor está en esta misma máquina". · [0.1.5]

**`main`.** Nombre estándar de la rama principal de un repositorio: la versión "buena", la que funciona. Los cambios se preparan en otras ramas y se incorporan a `main` cuando están revisados. · [0.1.2]

**Markdown.** Forma de dar formato a texto plano con símbolos sencillos (`#` para títulos, `**` para negrita, `-` para listas). Es el formato de los READMEs, de las celdas de texto de Jupyter y de este manual. · [0.1.4]

**markdownlint.** Extensión de VS Code que revisa el estilo de los archivos Markdown y subraya lo que no sigue las buenas prácticas. · [0.1.4]

**Mermaid.** Lenguaje para dibujar diagramas (flujos, secuencias) escritos como texto dentro de un bloque de código `mermaid`. GitHub los dibuja directamente. · [0.1.4]

**Paleta de comandos.** Buscador de VS Code (`Ctrl + Shift + P`) desde el que se ejecuta cualquier acción del editor escribiendo su nombre. · [0.1.3]

**Parser** (analizador). Programa que lee un texto con una sintaxis concreta y lo convierte en otra estructura; por ejemplo, Markdown en HTML. · [0.1.4]

**PATH.** Variable del sistema con la lista de carpetas donde la terminal busca los programas. Si un programa no está en esas carpetas, aparece el error "no se reconoce como comando". Tras instalar algo, hay que abrir una terminal nueva. · [0.1.1]

**pgAdmin.** Aplicación gráfica para administrar PostgreSQL y escribir consultas SQL. Su editor de consultas se llama *Query Tool*. · [0.1.5]

**pip.** El instalador de paquetes de Python. `pip install -r requirements.txt` instala todas las librerías de un proyecto. · [0.1.5]

**PostgreSQL.** Sistema gestor de bases de datos relacionales, de código abierto. Es el servidor de bases de datos del curso y escucha en el puerto 5432. · [0.1.5]

**Prompt.** La línea con la que la terminal indica que está lista para recibir un comando. Muestra la carpeta actual y termina en `>`, `%` o `$`. En los ejemplos no se copia. · [0.1.1]

**`psql`.** Cliente de PostgreSQL para la terminal. Hace lo mismo que pgAdmin, escribiendo comandos. · [0.1.5]

**Puerto.** Número que identifica un servicio dentro de un ordenador para las conexiones de red. PostgreSQL usa por defecto el 5432. · [0.1.5]

**Pull** (`git pull`). Descargar a nuestro repositorio local los commits nuevos del repositorio remoto. · [0.1.2]

**Pull request** (PR). Petición en GitHub para fusionar una rama en otra. Permite revisar los cambios línea a línea, comentarlos y dejar constancia de por qué se hicieron. Es una característica de GitHub, no de Git. · [0.1.2]

**Push** (`git push`). Subir nuestros commits locales al repositorio remoto. · [0.1.2]

**PyPI** (*Python Package Index*). Repositorio público de paquetes de Python, de donde pip descarga las librerías. · [0.1.5]

**Python install manager** (`py`). Gestor oficial de Python para Windows, que sustituye al instalador clásico. Instala, lista y desinstala versiones (`py install 3.14`, `py list`, `py uninstall 3.15`) y permite ejecutar una concreta con `py -V:3.14`. · [0.1.5]

**Rama** (*branch*). Línea de trabajo paralela dentro de un repositorio. Se hacen commits en ella sin afectar a `main` y, cuando el trabajo está listo, se fusiona. · [0.1.2]

**README.** Archivo `README.md` en la raíz de un repositorio que explica qué es el proyecto. GitHub lo muestra automáticamente como portada. · [0.1.4]

**Remoto** (*remote*). Copia de un repositorio alojada en otro sitio, normalmente GitHub. El remoto principal se llama por convención `origin`. · [0.1.2]

**Repositorio** (*repo*). Carpeta cuyo historial gestiona Git. Guarda toda la historia en una subcarpeta oculta `.git`. · [0.1.2]

**`requirements.txt`.** Archivo que enumera las librerías que necesita un proyecto de Python, para que cualquiera pueda recrear su entorno virtual. · [0.1.5]

**Ruta** (*path*). La dirección de un archivo: la secuencia de carpetas desde la raíz hasta él. Una **ruta absoluta** empieza en la raíz (`C:\Users\javier\proyectos`); una **ruta relativa** se interpreta desde la carpeta actual (`proyectos/mi-portfolio-data-analytics`). `.` es la carpeta actual y `..`, la carpeta padre. · [0.1.1]

**Servicio.** Programa que el sistema operativo arranca automáticamente y mantiene en segundo plano, como el servidor de PostgreSQL. · [0.1.5]

**Shell.** Programa que vive dentro de la terminal e interpreta los comandos que escribimos. En Windows usamos **PowerShell**; en macOS, **zsh**; en Linux, normalmente **bash**. · [0.1.1]

**Source Control.** Panel de VS Code para trabajar con Git sin escribir comandos: ver cambios, prepararlos, hacer commit y sincronizar con el remoto. · [0.1.3]

**Superusuario.** Usuario con todos los permisos sobre un sistema. En PostgreSQL se llama `postgres` y su contraseña se elige al instalar. · [0.1.5]

**Terminal.** Ventana donde damos órdenes al ordenador escribiendo texto en lugar de hacer clic. En Windows, *Windows Terminal*; en macOS, la app *Terminal*. VS Code tiene una **terminal integrada** en su panel inferior. · [0.1.1], [0.1.3]

**Texto plano.** Archivo que contiene solo caracteres, sin formato binario: `.md`, `.sql`, `.py`, `.csv`. Se abre con cualquier editor y Git puede mostrar qué líneas cambiaron. · [0.1.4]

**VS Code** (*Visual Studio Code*). Editor de código gratuito de Microsoft que se amplía con extensiones. En el curso es el sitio donde vive todo el texto del proyecto: SQL, Python, Markdown y Git. No confundir con Visual Studio. · [0.1.3]

---

## Bloque 1 — Fundamentos de Data Analytics

**Análisis descriptivo.** El que responde a **¿qué ha pasado?** Resume los datos con agregaciones, comparaciones y evolución en el tiempo. Es la base de los informes y dashboards de seguimiento. · [1.1.3]

**Análisis diagnóstico.** El que responde a **¿por qué ha pasado?** Investiga las causas de un resultado desglosándolo por dimensiones y contrastando hipótesis. · [1.1.3]

**Análisis predictivo.** El que responde a **¿qué va a pasar?** Usa patrones históricos para estimar resultados futuros, con un margen de error o una probabilidad. · [1.1.3]

**Análisis prescriptivo.** El que responde a **¿qué deberíamos hacer?** Combina predicciones con optimización para recomendar la mejor acción. · [1.1.3]

**Analytics Engineer.** Rol que transforma los datos almacenados en tablas limpias, documentadas y listas para analizar, normalmente con SQL y dbt. Está a medio camino entre Data Engineer y Data Analyst. · [1.1.1]

**BI Developer.** Rol que diseña y mantiene cuadros de mando e informes corporativos con herramientas como Power BI, Tableau o Qlik Sense. · [1.1.1]

**Business Intelligence** (BI). Conjunto de procesos y herramientas para convertir los datos de una organización en informes y cuadros de mando que apoyen las decisiones. · [1.1.1]

**Capa semántica.** Lugar único donde se definen las dimensiones, medidas y KPIs de una organización, del que beben todos los informes. Evita que haya dos versiones del mismo número. · [1.1.2]

**Churn** (tasa de abandono). Porcentaje de clientes que se dan de baja en un periodo sobre los que había al inicio. KPI clave en negocios de suscripción. · [1.1.2]

**Ciclo de vida del dato.** Recorrido de un dato desde que se crea hasta que alguien decide con él, en siete fases: generación, ingesta, almacenamiento, transformación, análisis, visualización y decisión. No es lineal: las decisiones generan preguntas nuevas. · [1.1.1]

**Clave primaria.** Columna, o combinación de columnas, que identifica cada fila de una tabla sin repetirse. En `ventas.csv` es `linea_id`; en `objetivos_mensuales.csv`, `tienda_id` más `mes`. · [1.1.2]

**Correlación y causalidad.** Que dos variables se muevan juntas (correlación) no demuestra que una cause la otra (causalidad). Los datos señalan dónde mirar; la causa se confirma con conocimiento del negocio o con experimentos. · [1.1.3]

**CRISP-DM** (*Cross-Industry Standard Process for Data Mining*). Metodología clásica para organizar un proyecto de datos en seis fases que se repiten: comprensión del negocio, comprensión de los datos, preparación, modelado, evaluación y despliegue. · [1.1.1]

**Criterio de exclusión.** Regla que indica qué registros no se cuentan en un KPI, y por qué; por ejemplo, los tickets anulados en las ventas netas. Sin él, dos personas calculan cifras distintas para el mismo indicador. · [1.1.2]

**CSV** (*Comma-Separated Values*). Formato de texto plano para tablas: una fila por línea y columnas separadas por comas. No guarda tipos de datos, así que cada herramienta decide cómo interpretar fechas y números. · [1.1.1]

**Cuadro de mando** (*dashboard*). Pantalla que reúne los indicadores clave de un área en un vistazo, normalmente con gráficos e interactividad. · [1.1.1]

**Data Analyst.** Rol que convierte datos en respuestas a preguntas de negocio: prepara datos, analiza y comunica los resultados. Es el perfil central de este curso. · [1.1.1]

**Data Analytics.** Proceso de examinar datos para extraer conclusiones que apoyen decisiones. Su objetivo es reducir la incertidumbre antes de decidir. · [1.1.1]

**Data-driven y data-informed.** Una organización *data-driven* deja que los datos guíen las decisiones; una *data-informed* los usa para informarlas, junto al contexto, la estrategia y el criterio. · [1.1.1]

**Data Architect.** Rol que diseña cómo se organizan, integran y almacenan los datos de la empresa: modelos, plataformas y estándares. El Data Engineer construye lo que el arquitecto diseña. · [1.1.1]

**Data Engineer.** Rol que construye y mantiene los flujos que mueven y almacenan los datos (ingesta, almacenamiento y transformación). · [1.1.1]

**Data owner.** Persona de negocio responsable de un conjunto de datos: plantea las preguntas, valida las definiciones y decide. · [1.1.1]

**Data Scientist.** Rol que construye modelos estadísticos y de machine learning, sobre todo para análisis predictivo y prescriptivo. · [1.1.1]

**Data Steward.** Rol que vela por la calidad, la definición y el buen uso de los datos de un área. Es transversal a todas las fases del ciclo de vida. · [1.1.1]

**Data warehouse** (almacén de datos). Base de datos diseñada para el análisis, que se alimenta de forma automática y periódica desde los sistemas operacionales. Se estudia en el bloque 5. · [1.1.1]

**Desglose** (*drill-down*). Técnica de análisis diagnóstico que descompone una cifra global por dimensiones (tienda, fecha, categoría) hasta encontrar dónde se concentra la variación. · [1.1.3]

**Diccionario de datos.** Documento que describe cada columna de un dataset: nombre, tipo, significado y un ejemplo. Es lo primero que se escribe ante un dataset nuevo. · [0.1.4], [1.1.2]

**DIKW** (*Data, Information, Knowledge, Wisdom*). Modelo que ordena dato, información, conocimiento y sabiduría como una pirámide. Un dato aislado no sirve: agregado se convierte en información; comparado y explicado, en conocimiento. · [1.1.1], [1.1.3]

**Dimensión.** Campo que describe o clasifica los datos y responde a ¿quién?, ¿dónde?, ¿cuándo?, ¿qué? Sirve para agrupar, filtrar y etiquetar, y no se suma ni se promedia. Por ejemplo, `tienda_id`, `fecha` o `categoria`. · [1.1.2]

**Efecto mezcla** (*mix effect*). Variación de una media o un porcentaje global que no se debe a que cambien los valores de cada grupo, sino a que cambia el peso de cada grupo en el total. · [1.1.3]

**Extracto.** Copia de datos obtenida de un sistema en un momento dado y guardada en un formato portable, como un CSV. No se actualiza sola y refleja las decisiones de quien la extrajo. · [1.1.1]

**Ficha de KPI.** Definición completa de un KPI: nombre, objetivo de negocio, fórmula, fuente, criterios de exclusión, meta, frecuencia y desglose, y responsable. · [1.1.2]

**Granularidad.** Nivel de detalle de cada fila de una tabla; se resume en la pregunta "¿qué representa exactamente un registro?". En `ventas.csv`, una fila es una línea de ticket, no un ticket. Ignorarla es la fuente de los errores más caros del análisis. · [1.1.2]

**Identificador.** Columna que sirve para distinguir elementos (`ticket_id`, `cliente_id`). Es una variable cualitativa nominal, aunque esté formada por números: se cuenta, pero nunca se opera con ella. · [1.1.2]

**Ingesta.** Fase del ciclo de vida en la que los datos se capturan en su origen y se mueven al entorno analítico. · [1.1.1]

**KPI** (*Key Performance Indicator*, indicador clave de rendimiento). Métrica ligada a un objetivo estratégico, con una meta y un responsable. Si nadie es responsable de mejorar un número, no es un KPI: es una métrica. · [1.1.2]

**LTV** (*Lifetime Value*, valor de vida del cliente). Ingresos que se espera obtener de un cliente durante toda su relación con la empresa. · [1.1.2]

**Madurez analítica.** Grado de desarrollo del uso de datos en una organización, en cuatro niveles que siguen los tipos de análisis: descriptivo, diagnóstico, predictivo y prescriptivo. Subir de nivel exige datos, procesos, personas y herramientas. · [1.1.3]

**Margen bruto.** (Ventas − coste de lo vendido) / ventas × 100. Lo que queda de cada euro vendido después de pagar el producto, antes de otros gastos como el alquiler o el personal. · [1.1.2]

**Medida.** Campo numérico sobre el que se calcula y que responde a ¿cuánto? y ¿cuántos? Se agrega con sumas, medias o recuentos, siempre en el contexto de alguna dimensión. · [1.1.2]

**Medida aditiva, semiaditiva y no aditiva.** Una medida **aditiva** se suma por cualquier dimensión (`importe`). Una **semiaditiva** se suma por algunas, pero no en el tiempo (el stock de un almacén). Una **no aditiva** no se suma por ninguna (precios, porcentajes, valoraciones) y hay que promediarla o recalcularla. · [1.1.2]

**Meta.** Valor de un KPI que separa el éxito del fracaso, como el objetivo de ventas de una tienda en un mes. · [1.1.2]

**Métrica.** Cálculo sobre los datos, como el ticket medio de un mes. Se convierte en KPI cuando se liga a un objetivo, con meta y responsable. · [1.1.2]

**Métrica de vanidad** (*vanity metric*). Cifra que queda bien en una presentación pero no ayuda a decidir, como las descargas totales de una app. Su alternativa son las métricas accionables. · [1.1.2]

**Métrica estrella** (*North Star Metric*). La métrica que mejor resume el valor que la empresa aporta a sus clientes, y que orienta a todos los equipos. · [1.1.2]

**NPS** (*Net Promoter Score*). Indicador de satisfacción: porcentaje de clientes promotores menos porcentaje de detractores. · [1.1.2]

**OKR** (*Objectives and Key Results*). Marco de gestión que fija un objetivo cualitativo y dos o tres resultados medibles para un periodo. Los KPIs miden la salud continua del negocio; los OKRs, el progreso hacia un cambio concreto. · [1.1.2]

**OLTP y OLAP.** Los sistemas **OLTP** (*Online Transaction Processing*) registran operaciones una a una, muy deprisa, como un TPV. Los sistemas **OLAP** (*Online Analytical Processing*) están pensados para leer y agregar grandes volúmenes de datos en el análisis. · [1.1.1]

**Paradoja de Simpson.** Caso extremo del efecto mezcla: una tendencia que aparece en todos los grupos se invierte al juntarlos. · [1.1.3]

**Sistema operacional.** Sistema que sostiene la operación diaria de un negocio registrando cada transacción: un TPV, un ERP, una app de pedidos. Es la fuente habitual de los datos que se analizan. · [1.1.1]

**Test A/B.** Experimento que compara dos versiones (A y B) asignadas al azar a grupos distintos para medir el efecto real de un cambio. Es la forma más fiable de demostrar una causa. · [1.1.3]

**Ticket medio.** Ventas divididas entre el número de tickets distintos. Si se divide entre filas de líneas de ticket, el resultado es erróneo: en Café Lumen, 2,97 € en lugar de 5,01 €. · [1.1.2]

**Tidy data** (datos ordenados). Forma de organizar un dataset tabular en la que cada columna es una variable, cada fila una observación y cada celda un único valor. · [1.1.2]

**TPV** (terminal punto de venta). La caja registradora digital de un comercio, que registra cada venta con sus productos, importes y hora. · [1.1.1]

**Transformación.** Fase del ciclo de vida en la que los datos se limpian, se estructuran y se enriquecen para poder analizarlos. · [1.1.1]

**Variable.** Característica que puede tomar valores distintos en cada registro; en un dataset tabular, una columna. · [1.1.2]

**Variable cualitativa.** Variable que toma categorías. **Nominal** si las categorías no tienen orden (`canal`, `ciudad`); **ordinal** si lo tienen (una valoración de 1 a 5 estrellas). · [1.1.2]

**Variable cuantitativa.** Variable numérica con la que tiene sentido operar. **Continua** si puede tomar cualquier valor en un rango (`importe`); **discreta** si resulta de contar (`cantidad`). · [1.1.2]

**Variable temporal.** Fecha u hora. Tiene orden como una ordinal y admite restas como una cuantitativa, y en el análisis se usa sobre todo para agrupar por periodos. · [1.1.2]

---

## Bloque 2 — SQL y bases de datos

**Alias.** Nombre alternativo que se da a una columna del resultado (`AS margen_pct`) o a una tabla dentro de una consulta (`FROM pedidos AS p`). No cambia la tabla: solo existe en la consulta. · [2.1.1], [2.1.3]

**Anti-join.** Patrón para encontrar las filas de una tabla que no tienen correspondencia en otra: `LEFT JOIN` seguido de `WHERE <clave de la derecha> IS NULL`, o `WHERE NOT EXISTS (...)`. Por ejemplo, los clientes que nunca han hecho un pedido. · [2.1.3], [2.2.1]

**Cardinalidad, trampa de la.** Error por el que un JOIN uno a muchos repite las filas del lado "uno" y hace que se sumen varias veces sus medidas. Se evita sumando las medidas de la tabla más detallada o con `COUNT(DISTINCT ...)`. · [2.1.3]

**CASE.** Expresión condicional de SQL: `CASE WHEN condición THEN valor ... ELSE valor END`. Evalúa las condiciones en orden y devuelve el valor de la primera que se cumple. Se usa, por ejemplo, para asignar segmentos. · [2.1.2], [2.2.2]

**Clave compuesta.** Clave primaria formada por varias columnas, porque ninguna sola identifica cada fila. En `lineas_pedido` es `pedido_id` + `num_linea`. · [2.1.1]

**Clave foránea** (*foreign key*). Columna que apunta a la clave primaria de otra tabla, como `productos.categoria_id` hacia `categorias`. La base de datos impide que apunte a una fila que no existe. · [2.1.1]

**COALESCE.** Función que devuelve el primero de sus argumentos que no es `NULL`: `COALESCE(codigo_promo, 'Sin código')`. Sirve para sustituir los vacíos por un valor. · [2.2.2]

**Cohorte.** Grupo de clientes definido por cuándo o cómo llegaron (el mes de su primera compra, el código que usaron). Para comparar cohortes de forma justa, todas deben haber tenido el mismo tiempo de observación. · [2.2.2]

**CTE** (*Common Table Expression*). Consulta con nombre definida con `WITH nombre AS (...)` al principio de una sentencia, que la consulta principal usa como una tabla. Varios CTEs encadenados permiten escribir un análisis por pasos. Solo existe mientras dura la sentencia. · [2.2.2]

**DDL y DML.** Familias de instrucciones de SQL. **DDL** (*Data Definition Language*) define la estructura: `CREATE`, `ALTER`, `DROP`. **DML** (*Data Manipulation Language*) cambia los datos: `INSERT`, `UPDATE`, `DELETE`. Las consultas con `SELECT` se agrupan a veces como **DQL**. · [2.1.1]

**Diagrama entidad-relación** (ER). Dibujo de las tablas de una base de datos, sus columnas y las relaciones entre ellas a través de las claves. · [2.1.1]

**DISTINCT.** Palabra clave que elimina las filas repetidas de un resultado (`SELECT DISTINCT provincia`) o cuenta valores distintos (`COUNT(DISTINCT cliente_id)`). · [2.1.1], [2.1.2]

**EXISTS.** Condición que es verdadera si una subconsulta devuelve al menos una fila. `WHERE EXISTS (...)` encuentra las filas con alguna fila relacionada en otra tabla (*semi-join*) y `WHERE NOT EXISTS (...)`, las que no tienen ninguna (*anti-join*). No multiplica filas, a diferencia de un JOIN. · [2.2.1]

**Función de agregación.** Función que resume muchas filas en un solo valor: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`. Todas ignoran los `NULL`, salvo `COUNT(*)`. · [2.1.2]

**Función de ventana** (*window function*). Función que calcula un valor a partir de un grupo de filas relacionadas con la fila actual (su ventana) sin juntarlas en una, como haría `GROUP BY`. Se reconoce por la cláusula `OVER (...)`: `PARTITION BY` define los grupos y `ORDER BY`, el orden dentro de cada uno. No se puede usar en el `WHERE`. · [2.2.3]

**GROUP BY.** Cláusula que reparte las filas en grupos según el valor de una o varias columnas, para calcular una agregación por grupo. Cada columna del `SELECT` debe estar en el `GROUP BY` o dentro de una agregación. · [2.1.2]

**HAVING.** Cláusula que filtra grupos después de agrupar, y por eso admite agregaciones: `HAVING COUNT(*) >= 5`. `WHERE` filtra filas antes de agrupar. · [2.1.2]

**Índice.** Estructura auxiliar que permite a la base de datos encontrar filas sin recorrer toda la tabla, como el índice de un libro. Las claves primarias tienen uno automáticamente. · [2.1.3]

**Integridad referencial.** Garantía de que ninguna clave foránea apunta a una fila inexistente. La base de datos la hace cumplir al insertar, modificar o borrar. · [2.1.1]

**JOIN.** Operación que combina las filas de dos tablas que se corresponden según una condición, normalmente la igualdad entre una clave foránea y una clave primaria. **INNER** devuelve solo las filas con correspondencia; **LEFT** conserva todas las de la izquierda; **RIGHT**, todas las de la derecha; **FULL**, todas las de ambas; **CROSS** combina todas con todas, sin condición. · [2.1.3]

**LAG y LEAD.** Funciones de ventana que devuelven el valor de una columna en la fila anterior (`LAG`) o siguiente (`LEAD`) según el orden de la ventana. `LAG(ventas, 12)` mira doce filas atrás. Se usan para comparar con el periodo anterior o medir el tiempo entre compras. · [2.2.3]

**Marco de la ventana** (*frame*). Las filas de la ventana que entran en el cálculo de cada fila. Con `ORDER BY` y sin más indicaciones va del principio hasta la fila actual (un acumulado); con `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`, son la fila actual y las dos anteriores (una media móvil). · [2.2.3]

**Media móvil.** Media de los últimos N periodos, recalculada en cada periodo. Suaviza los picos de una serie para ver su tendencia. · [2.2.3]

**Modelo relacional.** Forma de organizar los datos en tablas sobre un único tipo de cosa, relacionadas mediante claves, de modo que cada dato se guarda una sola vez. Lo propuso Edgar F. Codd en 1970. · [2.1.1]

**Normalización.** Proceso de repartir los datos en tablas para eliminar repeticiones, descrito por las formas normales. La operación contraria, **desnormalizar**, se hace a propósito en los extractos y los modelos analíticos para leer más deprisa. · [2.1.1]

**NULL.** Marca de valor ausente o desconocido: no es cero ni un texto vacío. Cualquier comparación con `NULL` da "desconocido", por lo que se pregunta por él con `IS NULL` o `IS NOT NULL`. · [2.1.1]

**Operaciones de conjuntos.** Combinan los resultados de dos consultas con la misma forma, uno debajo de otro. `UNION` une sin duplicados, `UNION ALL` une con duplicados, `INTERSECT` devuelve lo común y `EXCEPT` lo que está en la primera y no en la segunda. · [2.1.3]

**Orden lógico de ejecución.** Orden en que la base de datos procesa las cláusulas de una consulta, distinto del orden en que se escriben: `FROM` → `WHERE` → `GROUP BY` → `HAVING` → ventanas → `SELECT` → `ORDER BY` → `LIMIT`. Explica, por ejemplo, por qué un alias o una función de ventana no se pueden usar en el `WHERE`. · [2.1.1], [2.1.2], [2.2.3]

**Pareto, análisis de.** Ordenar los elementos (productos, clientes) de mayor a menor y calcular el porcentaje acumulado sobre el total, para ver cuántos concentran la mayor parte. La "regla del 80/20" dice que el 20 % de los elementos suele generar el 80 % del resultado, aunque no siempre se cumple. · [2.2.3]

**Plan de ejecución.** Secuencia de operaciones que el planificador de la base de datos elige para resolver una consulta (recorrer tablas, usar índices, estrategias de JOIN). Se consulta con `EXPLAIN`. · [2.1.3]

**Ranking, funciones de.** Funciones de ventana que numeran las filas según un orden. `ROW_NUMBER()` no repite nunca; `RANK()` da el mismo puesto a los empates y salta los siguientes (1, 1, 3); `DENSE_RANK()` también los iguala, pero sin saltos (1, 1, 2). Con `PARTITION BY` resuelven el "top N de cada grupo". · [2.2.3]

**Relación uno a muchos y muchos a muchos.** En una relación **uno a muchos** (1:N), cada fila de una tabla se relaciona con varias de otra: un cliente hace muchos pedidos. Una relación **muchos a muchos** (N:M), como pedidos y productos, se resuelve con una **tabla intermedia** (`lineas_pedido`) con una clave foránea hacia cada lado. · [2.1.1]

**Segmentación de clientes.** Reparto de los clientes en grupos con un comportamiento parecido (por frecuencia de compra, gasto o tiempo desde la última compra) para dirigir a cada grupo una acción distinta. · [2.2.2]

**SQL** (*Structured Query Language*). Lenguaje estándar para definir, modificar y consultar bases de datos relacionales. Es declarativo: se indica qué se quiere obtener y la base de datos decide cómo. Cada sistema habla un **dialecto** con funciones propias. · [2.1.1]

**Subconsulta.** Consulta completa escrita entre paréntesis dentro de otra. Si devuelve un valor (**escalar**) va donde iría un valor; si devuelve una lista, con `IN` o `EXISTS`; si devuelve una tabla, en el `FROM`. · [2.2.1]

**Subconsulta correlacionada.** Subconsulta que usa columnas de la consulta principal y, por eso, se evalúa conceptualmente una vez por cada fila. Permite comparar cada fila con su grupo, pero puede ser lenta en tablas grandes. · [2.2.1]

**Tabla derivada.** Subconsulta escrita en el `FROM`, con un alias, que la consulta principal usa como una tabla. Permite agregar dos veces: primero por cliente, después sobre esos resultados. · [2.2.1]

**Tipo de datos.** Clase de valores que admite una columna (`INTEGER`, `NUMERIC`, `VARCHAR`, `DATE`, `BOOLEAN`). La base de datos rechaza los valores que no encajan. Para dinero se usa `NUMERIC`, que es exacto. · [2.1.1]

**Ventas netas** (Casa Olivo). Suma del `subtotal` de los pedidos, excluidos los cancelados y los devueltos, sin gastos de envío. Es el KPI de referencia del bloque 2. En la base de datos está guardado como la vista `v_pedidos_validos`. · [2.1.2], [2.2.2]

**Vista** (*view*). Consulta guardada en la base de datos con un nombre (`CREATE VIEW`), que se consulta como una tabla. No guarda datos: se recalcula cada vez con las tablas de ese momento. Sirve para escribir una sola vez las definiciones de negocio que se repiten. · [2.2.2]

**Vista materializada.** Vista que sí guarda el resultado de su consulta. Se consulta muy deprisa, pero sus datos son los del último `REFRESH MATERIALIZED VIEW`. · [2.2.2]

---

## Bloque 3 — Python para análisis de datos

**Ámbito** (*scope*). Zona del código en la que existe una variable. Las variables creadas dentro de una función, incluidos sus parámetros, son **locales**: desaparecen al terminar la llamada y no se ven desde fuera. Las definidas fuera de cualquier función son **globales**. · [3.2.1]

**`assert`.** Instrucción que comprueba que una condición es verdadera y, si no lo es, detiene el programa con un `AssertionError`. Se usa para escribir pruebas rápidas de una función: `assert bloques_extra(31) == 1`. · [3.2.1]

**Bucle `for`.** Estructura que repite un bloque de código una vez por cada elemento de una colección: `for viaje in viajes:`. Con un acumulador o un diccionario dentro, sirve para sumar, contar o agrupar. · [3.1.3]

**Bucle `while`.** Estructura que repite un bloque de código mientras se cumpla una condición. Si nada dentro del bloque hace falsa la condición, el bucle no termina nunca (**bucle infinito**). · [3.1.3]

**Comprehension.** Forma abreviada de crear una lista, un diccionario o un set a partir de otra colección, con una condición opcional: `[m for m in minutos if m > 30]`. Se lee como un `SELECT ... FROM ... WHERE`. · [3.1.3]

**Diccionario** (`dict`). Colección de pares `clave: valor`, entre llaves, en la que cada valor se pide por su clave: `estacion["capacidad"]`. Las claves no se repiten. Es la forma natural de guardar un registro; una lista de diccionarios es una tabla. · [3.1.2]

**Docstring.** Texto entre comillas triples en la primera línea del cuerpo de una función que explica qué hace y qué devuelve. Python lo muestra con `help()` y VS Code al pasar el ratón por el nombre de la función. · [3.2.1]

**Estructura de datos.** Tipo que guarda muchos valores bajo un solo nombre. Las cuatro que trae Python son la lista, la tupla, el diccionario y el set. · [3.1.2]

**Excepción** (*exception*). Error que Python lanza cuando no puede ejecutar una instrucción, con un tipo (`ValueError`, `TypeError`, `KeyError`...) y un mensaje. Si nadie la captura con `try` y `except`, detiene el programa y muestra el traceback. · [3.2.1]

**f-string.** Texto con una `f` delante de las comillas en el que lo que va entre llaves se sustituye por su valor, con un formato opcional: `f"{ocupacion:.1%}"`. · [3.1.1]

**`float`.** Tipo de Python para los números con decimales. Es de coma flotante: guarda aproximaciones, por lo que `0.1 + 0.2` da `0.30000000000000004`. Los decimales se escriben con punto. · [3.1.1]

**Función.** Bloque de código con nombre que recibe datos por sus parámetros, hace un cálculo y devuelve el resultado con `return`. Se define con `def` y se llama escribiendo su nombre con paréntesis: `precio_viaje(38, "ocasional")`. Una función sin `return` devuelve `None`. · [3.2.1]

**`if`, `elif`, `else`.** Estructura condicional de Python: ejecuta el primer bloque cuya condición se cumple, en orden. Equivale al `CASE WHEN` de SQL. · [3.1.3]

**Imperativo** (lenguaje). Lenguaje en el que se escriben los pasos para obtener un resultado, como Python. Se opone a **declarativo**, como SQL, en el que se describe el resultado. · [3.1.1]

**Índice** (en Python). Posición de un elemento en un string, una lista o una tupla. Empieza en 0, y los índices negativos cuentan desde el final: `-1` es el último. · [3.1.2]

**Inmutable / mutable.** Un valor inmutable no se puede modificar una vez creado (números, strings, tuplas): sus métodos devuelven un valor nuevo. Uno mutable sí (listas, diccionarios, sets), y si dos variables apuntan a él, los cambios se ven a través de las dos. · [3.1.2]

**Iterable.** Objeto que puede entregar sus elementos uno a uno y que, por tanto, se puede recorrer con un `for`: listas, strings, diccionarios, `range`, `enumerate`, `zip`. · [3.1.3]

**Lista** (`list`). Secuencia ordenada y modificable de valores, entre corchetes: `[14, 9, 38]`. Admite repetidos y se accede a sus elementos por su índice. · [3.1.2]

**Método.** Función que pertenece a un tipo de datos y se escribe detrás del valor con un punto: `nombre.strip()`, `lista.append(x)`. · [3.1.2]

**`None`.** Valor de Python que representa la ausencia de dato, equivalente al `NULL` de SQL. Se pregunta por él con `is None`. · [3.1.1]

**Notebook.** Documento de Jupyter (`.ipynb`) formado por celdas de código y de Markdown que se ejecutan una a una y guardan su resultado. Se ejecuta en el orden en que se pulsan las celdas, no en el que aparecen; para comprobar que es reproducible se reinicia el kernel y se ejecuta todo. · [3.1.1]

**Parámetro y argumento.** El **parámetro** es el nombre que recibe un dato en la definición de una función (`def ocupacion(bicis, capacidad)`); el **argumento** es el valor concreto que se le pasa al llamarla (`ocupacion(2, 18)`). Los argumentos se pueden pasar por posición o por nombre: `ocupacion(capacidad=18, bicis=2)`. · [3.2.1]

**`raise`.** Instrucción que lanza una excepción con el mensaje que elijamos. Se usa para validar las entradas de una función: `raise ValueError("duración no válida")`. · [3.2.1]

**Sangría** (*indentation*). Espacios al principio de una línea. En Python forma parte de la sintaxis: las líneas con la misma sangría detrás de unos dos puntos forman un bloque. La convención son cuatro espacios. · [3.1.3]

**Set.** Colección sin orden y sin repetidos, entre llaves: `{"Plaza Mayor", "Parque del Río"}`. Admite las operaciones de conjuntos: unión `|`, intersección `&` y diferencia `-`. Un set vacío se crea con `set()`. · [3.1.2]

**Slicing.** Selección de un trozo de un string, una lista o una tupla con `[inicio:fin]`, que incluye `inicio` y excluye `fin`: `inicio[:10]`. · [3.1.2]

**String** (`str`). Tipo de Python para el texto, entre comillas simples o dobles. Es una secuencia inmutable de caracteres. · [3.1.1], [3.1.2]

**Traceback.** Informe que muestra Python cuando una excepción detiene el programa: el camino de llamadas que llevó hasta el error y, en la última línea, su tipo y su mensaje. Se lee empezando por esa última línea. · [3.2.1]

**`try` / `except`.** Estructura que captura una excepción: si dentro del `try` se produce el error indicado en el `except`, se ejecuta ese bloque en lugar de detener el programa. Conviene capturar solo el tipo de error que se espera: `except ValueError:`. · [3.2.1]

**Tupla** (`tuple`). Secuencia ordenada e inmutable, entre paréntesis: `(1, "Plaza Mayor", 14)`. Se usa para registros fijos y se puede desempaquetar en varias variables. Lo que crea una tupla son las comas: `precio = 1,50` es la tupla `(1, 50)`. · [3.1.2]

**Valor por defecto.** Valor que toma un parámetro si al llamar a la función no se indica: en `def precio_viaje(minutos, usuario, bici="mecánica")`, `bici` vale `"mecánica"` salvo que se pase otra. Los parámetros con valor por defecto van detrás de los que no lo tienen. · [3.2.1]

**Variable** (en Python). Nombre que se asigna a un valor con `=` para usarlo después. No declara su tipo: el tipo es del valor. No confundir con la variable estadística del bloque 1. · [3.1.1]

**Vectorización.** Aplicar una operación a una columna o un array completo de una vez, con código compilado, en lugar de recorrerlo elemento a elemento con un bucle de Python. Es lo que hace rápidos a NumPy y pandas. · [3.1.3]

---

[0.1.1]: ../Bloque%200%20-%20Preparación/0.1.1%20-%20Terminal%20básica.md
[0.1.2]: ../Bloque%200%20-%20Preparación/0.1.2%20-%20Git%20y%20GitHub.md
[0.1.3]: ../Bloque%200%20-%20Preparación/0.1.3%20-%20VS%20Code.md
[0.1.4]: ../Bloque%200%20-%20Preparación/0.1.4%20-%20Markdown%20para%20documentar.md
[0.1.5]: ../Bloque%200%20-%20Preparación/0.1.5%20-%20Instalación%20de%20Python,%20PostgreSQL%20y%20pgAdmin.md
[1.1.1]: ../Bloque%201%20-%20Fundamentos/1.1.1%20-%20Presentación%20del%20curso,%20ecosistema%20y%20ciclo%20de%20vida%20del%20dato.md
[1.1.2]: ../Bloque%201%20-%20Fundamentos/1.1.2%20-%20Variables,%20dimensiones,%20medidas%20y%20KPIs.md
[1.1.3]: ../Bloque%201%20-%20Fundamentos/1.1.3%20-%20Tipos%20de%20análisis.md
[2.1.1]: ../Bloque%202%20-%20SQL/2.1%20-%20Consultas%20básicas/2.1.1%20-%20Modelo%20relacional,%20SELECT,%20FROM,%20WHERE%20y%20AS.md
[2.1.2]: ../Bloque%202%20-%20SQL/2.1%20-%20Consultas%20básicas/2.1.2%20-%20Agregaciones,%20agrupación%20y%20ordenación.md
[2.1.3]: ../Bloque%202%20-%20SQL/2.1%20-%20Consultas%20básicas/2.1.3%20-%20JOINs%20y%20teoría%20de%20conjuntos.md
[2.2.1]: ../Bloque%202%20-%20SQL/2.2%20-%20SQL%20intermedio/2.2.1%20-%20Subconsultas.md
[2.2.2]: ../Bloque%202%20-%20SQL/2.2%20-%20SQL%20intermedio/2.2.2%20-%20Vistas%20y%20CTEs.md
[2.2.3]: ../Bloque%202%20-%20SQL/2.2%20-%20SQL%20intermedio/2.2.3%20-%20Funciones%20de%20ventana%20y%20práctica%20guiada.md
[3.1.1]: ../Bloque%203%20-%20Python/3.1%20-%20Sintaxis%20y%20estructuras%20de%20datos/3.1.1%20-%20Entorno,%20tipos%20de%20datos%20y%20operadores.md
[3.1.2]: ../Bloque%203%20-%20Python/3.1%20-%20Sintaxis%20y%20estructuras%20de%20datos/3.1.2%20-%20Strings,%20listas,%20tuplas,%20diccionarios%20y%20sets.md
[3.1.3]: ../Bloque%203%20-%20Python/3.1%20-%20Sintaxis%20y%20estructuras%20de%20datos/3.1.3%20-%20Control%20de%20flujo,%20bucles%20y%20comprehensions.md
[3.2.1]: ../Bloque%203%20-%20Python/3.2%20-%20Funciones%20y%20objetos/3.2.1%20-%20Funciones,%20parámetros,%20valores%20por%20defecto%20y%20manejo%20de%20errores.md
