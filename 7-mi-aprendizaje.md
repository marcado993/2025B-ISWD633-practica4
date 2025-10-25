# COMPLETAR  
Comparando sus conocimientos antes de hacer la práctica con sus conocimientos después de hacer la tarea, explicar los principales aprendizajes logrados para beneficio de su formación profesional.  
Si solucionó un problema presentado al realizar la práctica también se debe documentar.

## Mi Aprendizaje

Contextualizando, antes de realizar esta práctica, ya tenía conocimientos sobre cómo crear imágenes Docker y trabajar con volúmenes básicos. Sabía ejecutar contenedores, pero esta práctica me permitió profundizar en aspectos más avanzados de la gestión de recursos y políticas de contenedores cuando ejecuto contenedores.

### Principales aprendizajes:

**1. Limitación de recursos**
Aunque conocía Docker, nunca había implementado límites de memoria y CPU de manera práctica. Aprendí que puedo controlar exactamente cuánta RAM (`--memory`) y swap (`--memory-swap`) puede usar un contenedor, y cómo calcular la memoria swap disponible (memory-swap - memory). También descubrí cómo asignar núcleos de CPU específicos con `--cpuset-cpus`, lo cual es muy útil para optimizar aplicaciones en producción.

**2. Healthchecks**
Este fue un concepto completamente nuevo para mí. Entendí que no basta con que un contenedor esté corriendo; si no que se necesita verificar que el servicio dentro realmente funcione. Gracias a los comandos de healthchecks como `--health-cmd`, `--health-interval`, `--health-retries` y `--health-timeout` pude realizar consultas de chequeo al contenedor. Ahora sé que usar `curl -f` o `wget --spider` junto con `|| exit 1` es fundamental para que Docker detecte fallos correctamente.

**3. Políticas de reinicio**
A pesar de que son términos en inglés los cuales, ya por su significado dicen mucho `always`, `unless-stopped` y `on-failure`. Ahora comprendo:
- `no`: nunca reinicia (default)
- `always`: reinicia siempre, incluso después de reiniciar Docker
- `unless-stopped`: similar a always pero no reinicia si se detuvo manualmente
- `on-failure`: solo reinicia cuando hay un error (exit code ≠ 0)

Esto es crucial para aplicaciones en producción donde necesito garantizar disponibilidad.

**4. Mecanismo de caché de Docker**
Entendí que Docker cachea cada capa de la imagen. Cuando modifico solo el `index.html` y reconstruyo, las capas anteriores (FROM, RUN, etc.) se reutilizan, haciendo el build mucho más rápido. Esto me enseña a ordenar las instrucciones del Dockerfile estratégicamente.

### Problemas resueltos durante la práctica:

**Problema 1: Error "RUN yum -y update" falló**
Al construir la imagen con CentOS, el comando `yum -y update` fallaba. Investigué y descubrí que podría ser un problema de repositorios o conectividad. La solución fue usar `--progress=plain` para ver el log completo y diagnosticar. En algunos casos, cambiar a `centos:stream8` o usar `--no-cache` resolvió el problema.

**Problema 2: "COPY ./web /var/www/html" no encontraba la carpeta**
Al principio ejecutaba el build desde el directorio equivocado. Aprendí que el contexto de build (el último argumento `.`) debe ser el directorio que contiene la carpeta `web`. Solución: siempre verificar con `Set-Location` que estoy en el directorio correcto antes de ejecutar `docker build`.

**Problema 3: No entendía por qué los puertos no se mapeaban**
Usaba `-P` pero no veía los puertos. Descubrí que si el Dockerfile no tiene `EXPOSE`, Docker no sabe qué puertos publicar. Agregué `EXPOSE 80` al Dockerfile y funcionó perfectamente.

### Reflexión final:

Esta práctica consolidó mi comprensión de Docker más allá de simples contenedores. Ahora puedo diseñar aplicaciones containerizadas considerando recursos, alta disponibilidad y monitoreo de salud. Estos conocimientos son fundamentales para la parte de devops

