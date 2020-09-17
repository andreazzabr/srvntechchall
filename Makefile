C_GREEN ?= \e[32m
C_RESET ?= \e[0m

prep_infra:
	terraform init ./terraform
	terraform plan -target module.infra -var-file ./terraform/main.tfvars -out ./terraform/prep_infra.plan ./terraform
	terraform apply ./terraform/prep_infra.plan
	@echo "${C_GREEN}Infra is Ready ${C_RESET}"

prep_db:
	terraform plan -var tasktemplate=cdprep.json -var-file ./terraform/main.tfvars -out ./terraform/prep_db.plan ./terraform
	terraform apply ./terraform/prep_db.plan
	@echo "${C_GREEN} Preparing database, please wait... ${C_RESET}"
	sleep 90
	terraform plan -target module.ecsservice -var-file ./terraform/main.tfvars -out ./terraform/prep_db.plan -destroy ./terraform
	terraform apply ./terraform/prep_db.plan

serve:
	terraform plan -target module.ecsservice -var tasktemplate=cdserve.json -var-file ./terraform/main.tfvars -out ./terraform/serve.plan -destroy ./terraform
	terraform apply ./terraform/serve.plan
	terraform plan -target module.ecsservice -var tasktemplate=cdserve.json -var-file ./terraform/main.tfvars -out ./terraform/serve.plan ./terraform
	terraform apply ./terraform/serve.plan

dnsname:
	clear
	@echo "${C_GREEN} Please open your browser and visit:"
	@aws elbv2 describe-load-balancers --name srvntchall-alb | grep DNSName
	@echo "${C_RESET}"
	
create_everything:
	make prep_infra
	make prep_db
	make serve
	make dnsname
	
destroy_everything:
	terraform destroy -var-file ./terraform/main.tfvars -auto-approve ./terraform

