$CONTAINER_IMAGE_NAME="sonarqube"
$CONTAINER_IMAGE_TAG="latest"
$CONTAINER_FULL_NAME = $CONTAINER_IMAGE_NAME + ":" + $CONTAINER_IMAGE_TAG
$CONTAINER_REGISTRY_NAME="acrsonarqubeprod"
$CONTAINER_REGISTRY_FQDN="$CONTAINER_REGISTRY_NAME.azurecr.io"
$CONTAINER_FULL_NAME_WITH_FQDN=$CONTAINER_FULL_NAME+":"+$CONTAINER_REGISTRY_FQDN

#Navega a ruta de CorePlatform (Resource Group, SQL Azure y Azure Container Registry) y los crea
Set-Location .\CorePlatform

terraform init
terraform  apply -var-file="main.tfvars" -auto-approve

$connectionString = (terraform output connection_string)

write-host $connectionString

Set-Location -Path ".."


#Compilar imagen de docker y publicarla en el ACR
Set-Location .\Docker

az acr login --name $CONTAINER_REGISTRY_NAME

docker build -t $CONTAINER_FULL_NAME .
docker tag $CONTAINER_FULL_NAME $CONTAINER_FULL_NAME_WITH_FQDN
docker push $CONTAINER_FULL_NAME_WITH_FQDN

Set-Location -Path ".."

#https://github.com/Hupka/sonarqube-azure-setup
#https://pumpingco.de/blog/deploy-an-azure-web-app-for-containers-with-terraform/