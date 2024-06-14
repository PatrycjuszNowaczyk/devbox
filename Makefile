# Makefile for managing the project with Docker

# Variables
DOCKER_COMPOSE=docker compose

define CERTS_HELP
To create certificates for HTTPS, run the following command:

  make certs

This will create a self-signed certificate for localhost.
All the generated files will be stored in the ./docker/nginx/ssl directory.

After running this, add the generated dev_cert_ca.cert.pem to the trusted root
authorities in your browser / client system.

For more information, see the README.md file.
endef
export CERTS_HELP

# Targets
.PHONY: init up down logs rebuild clean certs ps help

# Default target
.DEFAULT_GOAL := help

# Initialize development environment
init:
	@chmod +x ./scripts/init.sh
	@./scripts/init.sh

# Start the application
up:
	@chmod +x ./scripts/up.sh
	@./scripts/up.sh

# Stop the application
down:
	@$(DOCKER_COMPOSE) down

# View logs
logs:
	@$(DOCKER_COMPOSE) logs -f

# Rebuild the application
rebuild:
	@$(DOCKER_COMPOSE) up -d --build

# Clean and remove volumes
clean:
	@$(DOCKER_COMPOSE) down -v

# Open a bash shell in the PHP container
bash-php:
	@$(DOCKER_COMPOSE) exec php bash

# Show running containers from compose file
ps:
	@$(DOCKER_COMPOSE) ps

# Create certificates for HTTPS
certs:
	@chmod +x ./docker/nginx/ssl/dev_signed_cert.sh
	@./docker/nginx/ssl/dev_signed_cert.sh localhost

# Display help message
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  init      Initialize development environment"
	@echo "  up        Start the application"
	@echo "  down      Stop the application"
	@echo "  logs      View logs"
	@echo "  rebuild   Rebuild the containers"
	@echo "  clean     Clean and remove volumes"
	@echo "  bash-php  Open a bash shell in the PHP container"
	@echo "  ps        Show running containers from compose file"
	@echo "  certs     Create certificates for HTTPS"
	@echo "  help      Display this help message"
	@echo "\n"
	@echo "-----------------------------------------------------"
	@echo "$$CERTS_HELP"
