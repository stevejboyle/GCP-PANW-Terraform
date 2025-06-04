
.PHONY: init apply destroy validate plan

ENV ?= dev
INSTANCE ?= vm-01
WORK_DIR=./environments/$(ENV)/$(INSTANCE)

init:
	cd $(WORK_DIR) && terraform init

plan: init
	cd $(WORK_DIR) && terraform plan

apply: init
	cd $(WORK_DIR) && terraform apply

destroy: init
	cd $(WORK_DIR) && terraform destroy

validate: init
	cd $(WORK_DIR) && terraform validate

create-instance:
	./automation-scripts/create_instance.sh $(ENV) $(INSTANCE)
