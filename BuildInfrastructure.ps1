#Navega a ruta de CorePlatform (Resource Group, SQL Azure y Azure Container Registry) y los crea
Set-Location .\CorePlatform

terraform init
terraform  apply -var-file="main.tfvars" -auto-approve

$connectionString = (terraform output connection_string)

write-host $connectionString

Set-Location -Path ".."


#Publica imagen de Docker a ACR

#https://github.com/Hupka/sonarqube-azure-setup
#https://pumpingco.de/blog/deploy-an-azure-web-app-for-containers-with-terraform/