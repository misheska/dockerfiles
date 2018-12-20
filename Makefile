DOCKERFILES=$(shell find * -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))

.PHONY: all
all: $(IMAGES)

.PHONY: $(IMAGES)
$(IMAGES): %:
	docker build -t $@ $(subst :,/,$@)
