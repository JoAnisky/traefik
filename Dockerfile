FROM traefik:v3.6
ARG ENVIRONMENT
COPY config/traefik/traefik.${ENVIRONMENT}.yml /etc/traefik/traefik.yml
