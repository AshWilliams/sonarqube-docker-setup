Set-Location .\CorePlatform

terraform init
terraform destroy -var-file="main.tfvars" -auto-approve

Set-Location -Path ".."