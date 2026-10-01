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

[0.1.1]: ../Bloque%200%20-%20Preparación/0.1.1%20-%20Terminal%20básica.md
[0.1.2]: ../Bloque%200%20-%20Preparación/0.1.2%20-%20Git%20y%20GitHub.md
[0.1.3]: ../Bloque%200%20-%20Preparación/0.1.3%20-%20VS%20Code.md
[0.1.4]: ../Bloque%200%20-%20Preparación/0.1.4%20-%20Markdown%20para%20documentar.md
[0.1.5]: ../Bloque%200%20-%20Preparación/0.1.5%20-%20Instalación%20de%20Python,%20PostgreSQL%20y%20pgAdmin.md
[1.1.1]: ../Bloque%201%20-%20Fundamentos/1.1.1%20-%20Presentación%20del%20curso,%20ecosistema%20y%20ciclo%20de%20vida%20del%20dato.md
[1.1.2]: ../Bloque%201%20-%20Fundamentos/1.1.2%20-%20Variables,%20dimensiones,%20medidas%20y%20KPIs.md
[1.1.3]: ../Bloque%201%20-%20Fundamentos/1.1.3%20-%20Tipos%20de%20análisis.md
