
.terraform:
	terraform init

plan.file: .terraform
	terraform plan -out plan.file

plan.json: plan.file
	terraform show -json plan.file | jq > plan.json

.PHONY: plan
plan: plan.json

.PHONY: clean
clean:
	-@rm -rf .terraform
	-@rm plan.file
	-@rm plan.json
