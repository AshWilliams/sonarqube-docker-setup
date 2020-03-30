#Navega a ruta de CorePlatform (Resource Group, SQL Azure y Azure Container Registry) y los crea
Set-Location .\CorePlatform

terraform init
terraform  apply -var-file="main.tfvars" -auto-approve

# $connectionString = (terraform output connection_string)
# $username = (terraform output DatabaseUser)
# $contrasena = (terraform output DatabasePassword)

# write-host $connectionString
# write-host $username
# write-host $contrasena

Set-Location -Path ".."

#Publicación de container de docker hacia ACR
Set-Location .\Docker
# .\PublishContainer.ps1 -connString $connectionString -username $username -contrasena $contrasena
.\PublishContainer.ps1 
Set-Location -Path ".."

#https://github.com/Hupka/sonarqube-azure-setup
#https://pumpingco.de/blog/deploy-an-azure-web-app-for-containers-with-terraform/
#https://www.natmarchand.fr/sonarqube-azure-webapp-containers/
#SONARQUBE_JDBC_URL
#jdbc:sqlserver://sql-sonarqube-prod.database.windows.net:1433;database=ssqldb-sonarqube-prod;user=sonarqube@sql-sonarqube-shared-andresi;password=sonar@azur3!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;