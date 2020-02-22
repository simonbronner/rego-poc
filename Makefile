
.PHONY: plan
plan: opa
	cd terraform && make plan.json
	cp terraform/plan.json opa/data

.PHONY: clean
clean:
	cd terraform && make clean

opa:
	mkdir opa
	mkdir opa/rules
	mkdir opa/data

init: opa plan
	echo "Hello"
