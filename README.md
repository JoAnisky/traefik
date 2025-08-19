# Traefik avec Docker (multi-environnements)

> Une stack Docker prête à l’emploi pour exécuter Traefik en local (dev) et en production, avec gestion centralisée des variables d’environnement, authentification du dashboard, et support HTTPS automatique via Let’s Encrypt.

## 📂 Structure du projet
```text
.
├── config/
│   └── traefik/
│       ├── traefik.dev.yml
│       ├── traefik.prod.yml
│       └── dynamic/        # (optionnel, middlewares, tls, etc...)
│           ├── middlewares.yml
│           └── tls.yml
├── docker-compose.yml
├── .env.docker.dev
├── .env.docker.prod
└── README.md
```

- `.env.docker.dev` → variables pour l’environnement dev
- `.env.docker.prod` → variables pour l’environnement prod
- `.env` → généré automatiquement par le Makefile, jamais versionné

## ⚙️ Variables d’environnement

### 🔧 Développement → `.env.docker.dev`

```dotenv
ENVIRONMENT=dev
PROJECT_NAME=dev
DOMAIN=dev.local
```

### 🛡️ Production → `.env.docker.prod`

```dotenv
PROJECT_NAME=traefik
DOMAIN=traefik.your-domain.fr
ENVIRONMENT=prod
BASIC_AUTH_USERS=admin:$apr1$somehash$hashhere
LETSENCRYPT_EMAIL=admin@your-domain.fr
```

> ⚠️ Les caractères $ doivent être échappés avec $$ dans les fichiers .env.

## 🚀 Commandes disponibles

Toutes les commandes passent par `make` (voir `Makefile`)

### ▶️ Lancer Traefik en développement
```bash
make up-dev
```

### ▶️ Lancer Traefik en production
```bash
make up-prod
```

⏹️ Arrêter et nettoyer les conteneurs + volumes
```bash
make down
````

📜 Voir les logs
```bash
make logs
```

### 🛡️ Notes importantes

- En développement :
  - Dashboard accessible sans authentification
  - Pas de HTTPS (HTTP uniquement)

- En production :
  - Dashboard protégé par authentification basique
  - HTTPS activé via Let’s Encrypt

- Le dossier traefik-certs/ est monté en volume pour stocker les certificats SSL générés.