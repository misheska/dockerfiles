DOCKERFILES=$(shell find * -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))

# .PHONY: $(IMAGES)
$(IMAGES): %:
	docker build -t $@ $(subst :,/,$@)

# .PHONY: build 
build: $(IMAGES)

.PHONY: assure
assure: ## Run tests
	docker run --rm -i -v $(CURDIR):/usr/src:ro --workdir /usr/src sheska/shellcheck ./assure.sh

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

