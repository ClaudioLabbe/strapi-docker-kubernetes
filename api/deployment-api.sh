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
echo "deployment API"

#docker build . -t us.gcr.io/proyecto-docker-301320/strapi-app
docker build . -t $HOSTNAME/$PROJECT_ID/$IMAGE_NAME
#docker push us.gcr.io/proyecto-docker-301320/strapi-app
docker push $HOSTNAME/$PROJECT_ID/$IMAGE_NAME

kubectl apply -f deployment.yml
kubectl apply -f service.yml

echo "FIN"