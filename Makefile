# Lancer Traefik en dev
up-dev:
	cp .env.docker.dev .env
	docker compose up -d --build

# Lancer Traefik en prod
up-prod:
	cp .env.docker.prod .env
	docker compose up -d --build

# Stopper et nettoyer (utilise le .env courant)
down:
	docker compose down -v

logs:
	docker compose logs -f traefik
