# strapi-docker-kubernetes

GCP: instancia MySQL:
- crear instancia de base de dato SQL.
- crear base de dato, ejemplo: "strapi"
- seleccionar ip privada
- crear usuario

Cargar dump.sql
- Crear STORAGE
- Subir archivo dump.sql al Bucket
- Creacion de tablas y su respectiblo poblado
    - Ir a la instancia e importar dump.sql seleccionando la base de dato anteriormente creada

Crear cuenta de servicio para conectarse a SQL, luego generar llave

Autenticar con GCLOUD por consola
    gcloud init

Crear secretos con la cuenta de servicio SQL
- kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json="llave descargada"

credenciales BDD
- kubectl create secret generic cloudsql-db-credentials --from-literal=username="usuario" --from-literal=password="contraseña" --from-literal=dbname="base de dato"

----------------------------------------------

# API

creacion imagen:
- docker build . -t []/[]/"nombre de la imagen"
    - ejemplo: docker build . -t us.gcr.io/"IDPROYECTO"/strapi_app
- docker push []/[]/"nombre de la imagen"
    - ejemplo: docker push us.gcr.io/"IDPROYECTO"/strapi_app

Monificar deployment.yml con la zona, ID de tu proyecto y nombre de la imagen creada.
- Ejecutar:
    - kubectl apply -f pvc.yaml
    - kubectl apply -f deployment.yml
    - kubectl apply -f service.yml
----------------------------------------------

# CLIENTE

creacion imagen:
- docker build . -t []/[]/"nombre de la imagen"
    - ejemplo: docker build . -t us.gcr.io/"IDPROYECTO"/strapi_app
- docker push []/[]/"nombre de la imagen"
    - ejemplo: docker push us.gcr.io/"IDPROYECTO"/strapi_app

Monificar deployment.yml con la zona, ID de tu proyecto y nombre de la imagen creada,a demas modificar la variable de entorno "REACT_APP_BACKEND_URL" con la ruta de la API ejemplo "http://12.345.678.901:1337"
- Ejecutar:
    - kubectl apply -f deployment.yml
    - kubectl apply -f service.yml