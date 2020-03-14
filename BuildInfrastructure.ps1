#Navega a ruta de CorePlatform (Resource Group, SQL Azure y Azure Container Registry) y los crea
Set-Location .\CorePlatform

terraform init
terraform  apply -var-file="main.tfvars" -auto-approve

$connectionString = (terraform output connection_string)

write-host $connectionString

Set-Location -Path ".."

#Publicación de container de docker hacia ACR
Set-Location .\Docker
.\PublishContainer.ps1 -connString $connectionString
Set-Location -Path ".."

#https://github.com/Hupka/sonarqube-azure-setup
#https://pumpingco.de/blog/deploy-an-azure-web-app-for-containers-with-terraform/