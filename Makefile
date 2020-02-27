
.PHONY: plan
plan: opa
	cd terraform && make plan.json
	cp terraform/plan.json opa/data

.PHONY: clean
clean:
	cd terraform && make clean

repl: plan
	docker run -it -w /app \
		-v $$(pwd)/opa:/app \
		openpolicyagent/opa run \
		-w -l debug /app
