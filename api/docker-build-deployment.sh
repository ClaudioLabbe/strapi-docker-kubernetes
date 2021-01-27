#!/bin/sh
VERSION=$(date "+%Y%m%d%H%M%S")
HOSTNAME=$1
PROJECT_ID=$2
IMAGE_NAME=$3

if [ -z "$HOSTNAME"]; then
    echo "Debe ingresar los parametros HOSTNAME"
    exit
elif [ -z "$PROJECT_ID"]; then
    echo "Debe ingresar los parametros PROJECT_ID"
    exit
elif [ -z "$IMAGE_NAME"]; then
    echo "Debe ingresar los parametros IMAGE_NAME"
    exit
fi  
echo "docker build API"

docker build . -t $HOSTNAME/$PROJECT_ID/$IMAGE_NAME:$VERSION
docker push $HOSTNAME/$PROJECT_ID/$IMAGE_NAME:$VERSION

echo "FIN docker build"

echo "deployment API"

cd k8s

sed -i "" "s/strapi_app@/$IMAGE_NAME:$VERSION/g" deployment.yml

kubectl apply -f deployment.yml
kubectl apply -f service.yml

sed -i "" "s/$IMAGE_NAME:$VERSION/strapi_app@/g" deployment.yml
echo "FIN deployment"