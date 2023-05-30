.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo ""
	@echo "  build       build docker image"
	@echo ""
	@echo "  exec        launch a shell in a running docker container"
	@echo ""
	@echo "  git-push-f  commit and force push with message M=\"...\""
	@echo ""
	@echo "  git-undo-d  undo deletion (not yet committed) of one or more files"
	@echo ""
	@echo "  rmi         remove docker image"
	@echo ""
	@echo "  run         deploy docker container"
	@echo ""
	@echo "  stop        stop docker container"
	@echo ""
	@echo "  test        run pytest and create test-coverage badge"
	@echo ""
	@echo "Check the Makefile to know exactly what each target is doing."

.PHONY: build
build:
	@echo "Building docker image..."
	docker build -t aws-cdk-demo .
	@echo "Done!"

.PHONY: exec
exec:
	docker exec -it aws-cdk-demo /bin/bash

.PHONY: git-push-f
git-push-f:
	@echo "Committing and force pushing..."
	git add . && git commit -m "$(M)" && git push -f
	@echo "Done!"

.PHONY: git-undo-d
git-undo-d:
	git ls-files -d | xargs git checkout --

.PHONY: rmi
rmi:
	@echo "Removing docker image..."
	docker rmi aws-cdk-demo
	@echo "Done!"

.PHONY: run
run:
	@echo "Deploying docker container..."
	docker run -itd --rm \
		-p 8888:8888 \
		-v `pwd`:/home/project \
		--cpus=8 \
		--memory=8g \
		--name aws-cdk-demo \
		--ulimit nofile=1000000:1000000 \
		aws-cdk-demo /bin/bash
	@echo "Done!"

.PHONY: test
test:
	@echo "Running tests..."
	pytest --cov --cov-report term-missing
	@echo "Creating badge..."
	rm -f assets/coverage/coverage.svg
	coverage-badge -o assets/coverage/coverage.svg
	@echo "Done!"

.PHONY: stop
stop:
	@echo "Stopping docker container..."
	docker stop aws-cdk-demo
	@echo "Done!"
