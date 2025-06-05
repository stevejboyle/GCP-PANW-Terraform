
.PHONY: init apply destroy validate plan replace-ssh-key

ENV ?= dev
INSTANCE ?= vm-01
WORK_DIR=./environments/$(ENV)/$(INSTANCE)

init:
	cd $(WORK_DIR) && terraform init

replace-ssh-key:
	@if [ -z "$(SSH_KEY_FILE)" ]; then \
		echo "❌ Must provide SSH_KEY_FILE=<path-to-your-key>"; \
		exit 1; \
	fi
	@echo "🔑 Replacing gcp.key.pub across all environments using $(SSH_KEY_FILE)"
	@find environments -name gcp.key.pub -exec cp $(SSH_KEY_FILE) {} \;
	@echo "✅ Replacement complete."

plan: init
	cd $(WORK_DIR) && terraform plan

apply: replace-ssh-key init
	cd $(WORK_DIR) && terraform apply

destroy: init
	cd $(WORK_DIR) && terraform destroy

validate: init
	cd $(WORK_DIR) && terraform validate

create-instance:
	./automation-scripts/create_instance.sh $(ENV) $(INSTANCE)
