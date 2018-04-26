.DEFAULT_GOAL := help

$PHP_VERSION =

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: docker_build
docker_build: ## Build php for a specific version.
	@scripts/prepare-build
	@docker exec -it webshop-php rm -rf /tmp/*
