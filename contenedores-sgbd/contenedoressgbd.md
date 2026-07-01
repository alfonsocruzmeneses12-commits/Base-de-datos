# Contendores de Sistemas Gestores de Base de Datos
![ImagenDocker](../img/doker.png)
# Contenedores Docker Description
| Comandos | Descripcion |
|:---|:---|
| **docker pull  nombre_imagen** | _Descargar una imagen Docker Hub_
[DockerHub](https://hub.docker.com/)|
|**docker images** | _Visualiza las imagenes_ |
|**docker run** | _Crea un contenedor_ |
|**docker ps** | _visualiza todos los contenedores en ejecucuion_ |
|**docker conteiner ls** | _visualiza todos loc contenedores en ejecucion_ |
|**docker ps -a** | _visualiza toods los contenedores en ejecucion y no en ejecucion_ |
|**docker container ls -a** | _visualiza todos los contenedores en ejecucion y no en ejecucion_ |
|**docker stop nombre_contenedor o ID**|_Detiene un contendeor_|
|**docker start nombre_contendor o ID**|_Inicio el contendeor_|
|**docker rm nombre_contendor o ID**|_Elimina el contenedor_| 
|**docker rm - f nombre_contendor o ID**|_Elimina un contenedor que esta en ejecucion_|
|**docker volume ls**|_Lista los volumenes que tiene docker_|
|**docker volume create nombre_valumen**|_Crea un volumen_|
|**docker volume rm nombre_volumen**|_Elimina el volumen_|




# Comandos de Contenedores 

```
docker pull docker/getting-started 
```
# Contenedores tutoriales de doker

```
docker run -d --name tutorial-docker -p 80:80  d79336f4812b

docker run -d --name tutorial-docker -p 80:80 docker/getting-started-latest

```

# Contenedor de MariaDB Sin Volumen

```
docker run -d --name server-MariaDBG3 -p 3306:3309  70385bd0d0f4

```
# Contenedor de MariaDB Con volumen

```
docker run -d --name server-MariaDBG3 \
-p 3306:3309 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-mariadbg3:/var/lib/mysql 70385

```
# Contenedor de postgres Con Volumen
```
docker run -d --name server-postgresg3 \
-e POSTGRES_PASSWORD=12345 \
-p 5456:5432 -v vol-postgresg3:/var/lib/postgresql/data \
eba8d
```
# Contenedores de SQL
```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Poncho1208" \
   -u 0 \
   -p 1450:1433 --name SQLServerG3 \
   -d -v vol-sqlserverg3:/var/opt/mssql/data \
   e07b9
   ```