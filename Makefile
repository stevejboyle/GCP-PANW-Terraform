.PHONY: apply plan destroy create-instance delete-instance replace-ssh-key

create-instance:
	./automation-scripts/create-instance.sh $(ENV) $(INSTANCE) $(SSH_KEY_FILE) $(PROJECT) $(REGION) $(ZONE)

replace-ssh-key:
	./automation-scripts/replace-ssh-key.sh $(ENV) $(INSTANCE) $(SSH_KEY_FILE)

apply:
	make replace-ssh-key ENV=$(ENV) INSTANCE=$(INSTANCE) SSH_KEY_FILE=$(SSH_KEY_FILE)
	cd ./environments/$(ENV)/$(INSTANCE) && terraform init
	cd ./environments/$(ENV)/$(INSTANCE) && terraform apply

plan:
	make replace-ssh-key ENV=$(ENV) INSTANCE=$(INSTANCE) SSH_KEY_FILE=$(SSH_KEY_FILE)
	cd ./environments/$(ENV)/$(INSTANCE) && terraform init
	cd ./environments/$(ENV)/$(INSTANCE) && terraform plan

destroy:
	cd ./environments/$(ENV)/$(INSTANCE) && terraform destroy

delete-instance:
	@if [ -d "./environments/$(ENV)/$(INSTANCE)" ]; then \
		echo "Deleting instance directory: ./environments/$(ENV)/$(INSTANCE)"; \
		rm -rf ./environments/$(ENV)/$(INSTANCE); \
	else \
		echo "Instance directory ./environments/$(ENV)/$(INSTANCE) does not exist."; \
	fi
