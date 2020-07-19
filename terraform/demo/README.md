#TO RUN ON YOU MACHINE
1. Update the provider.tf file
2. Run the below commands
  terraform init -backend-config="demo-us-east-1/env.tf"
  terraform plan -var-file="demo-us-east-1/vars.tfvars"
  terraform apply -var-file="demo-us-east-1/vars.tfvars"
