# Políticas de reinicio

## Para esta parte de la práctica
1. Usa el archivo Dockerfile que se encuentra en cada carpeta con el nombre de la política de reinicio para crear una imagen. Analiza las instrucciones de cada Dockerfile 
2. Usa la imagen para ejecutar un contenedor agregando la política respectiva y observar lo que sucede verificando el cumplimiento de la política de reinicio

### no
No reinicia el contenedor bajo ninguna razón. Esta es la política por default

**Construir la imagen:**
```
docker build -t politica-no:v1 ./no
```

**Ejecutar el contenedor:**
```
docker run -d --name contenedor-no politica-no:v1
```
![alt text](image-4.png)

### always
Reinicia siempre el contenedor si se detiene. Si se detiene manualmente, sólo se reiniciará cuando se reinicie el demonio Docker o cuando se reinicie manualmente el propio contenedor

**Construir la imagen:**
```
docker build -t politica-always:v1 ./always
```

**Ejecutar el contenedor:**
```
docker run -d --name contenedor-always --restart always politica-always:v1
```
![alt text](image-5.png)

### unless-stopped

Similar a always, excepto que cuando el contenedor se detiene (manualmente o de otra manera), no se reinicia incluso después de reiniciar el demonio Docker.

**Construir la imagen:**
```
docker build -t politica-unless-stopped:v1 ./unless-stopped
```

**Ejecutar el contenedor:**
```
docker run -d --name contenedor-unless-stopped --restart unless-stopped politica-unless-stopped:v1
```
![alt text](image-6.png)

### on-failure
Se reinicia únicamente cuando hay una falla en la ejecución del código que se manifiesta con un código diferente de 0. No se reinicia si el contenedor se detiene manualmente.

**Construir la imagen:**
```
docker build -t politica-on-failure:v1 ./on-failure
```

**Ejecutar el contenedor:**
```
docker run -d --name contenedor-on-failure --restart on-failure politica-on-failure:v1
```
![alt text](image-7.png)