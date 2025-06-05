
.PHONY: validate apply plan destroy create-instance

validate:
	terraform fmt -recursive
	terraform validate

create-instance:
	./automation-scripts/create-instance.sh $(ENV) $(INSTANCE) $(SSH_KEY_FILE)

apply:
	make create-instance ENV=$(ENV) INSTANCE=$(INSTANCE) SSH_KEY_FILE=$(SSH_KEY_FILE)
	cd ./environments/$(ENV)/$(INSTANCE) && terraform init
	cd ./environments/$(ENV)/$(INSTANCE) && terraform apply

plan:
	make create-instance ENV=$(ENV) INSTANCE=$(INSTANCE) SSH_KEY_FILE=$(SSH_KEY_FILE)
	cd ./environments/$(ENV)/$(INSTANCE) && terraform init
	cd ./environments/$(ENV)/$(INSTANCE) && terraform plan

destroy:
	cd ./environments/$(ENV)/$(INSTANCE) && terraform destroy
