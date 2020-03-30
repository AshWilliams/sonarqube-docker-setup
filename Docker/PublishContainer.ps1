# param([string]$connString = "", [string]$username ="", [string] $contrasena="")

# $container_image_tag="sonarqube:latest"
$CONTAINER_REGISTRY_NAME="acrsonarqubeprod"
# $CONTAINER_REGISTRY_FQDN="$CONTAINER_REGISTRY_NAME.azurecr.io"
# $CONTAINER_COMPLETE = $CONTAINER_REGISTRY_FQDN + "/" + $CONTAINER_FULL_NAME

# (Get-Content .\DockerFile).replace('%%CREDENCIAL%%', $connString) | Set-Content .\DockerFile
# (Get-Content .\DockerFile).replace('%%USERNAME%%', $username) | Set-Content .\DockerFile
# (Get-Content .\DockerFile).replace('%%PASSWORD%%', $contrasena) | Set-Content .\DockerFile

az acr login --name $CONTAINER_REGISTRY_NAME

docker build -t "sonarqube:latest" .
docker tag "sonarqube:latest" "acrsonarqubeprod.azurecr.io/sonarqube:latest"
docker push "acrsonarqubeprod.azurecr.io/sonarqube:latest"