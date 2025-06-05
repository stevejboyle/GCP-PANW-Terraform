
.PHONY: validate apply plan destroy


create-instance:
	./automation-scripts/create-instance.sh $(ENV) $(INSTANCE) $(SSH_KEY_FILE)

apply:
	ENV=$(ENV) INSTANCE=$(INSTANCE) ./automation-scripts/replace-ssh-key.sh $(ENV) $(INSTANCE) $(SSH_KEY_FILE)
	cd ./environments/$(ENV)/$(INSTANCE) && TF_VAR_environment=$(ENV) terraform init
	cd ./environments/$(ENV)/$(INSTANCE) && TF_VAR_environment=$(ENV) terraform apply

plan:
	cd ./environments/$(ENV)/$(INSTANCE) && TF_VAR_environment=$(ENV) terraform plan

destroy:
	cd ./environments/$(ENV)/$(INSTANCE) && TF_VAR_environment=$(ENV) terraform destroy

validate:
	terraform fmt -recursive
	terraform validate
