IMAGE := python-type-annotations
TAG ?= latest

.PHONY: typing typing-local

# Build the image and run the type check inside the container.
typing:
	docker build -t $(IMAGE):$(TAG) .
	docker run --rm $(IMAGE):$(TAG)

# Same check without Docker, for quick local iteration.
typing-local:
	uv run mypy challenge/
