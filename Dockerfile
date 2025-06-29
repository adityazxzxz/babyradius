FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y freeradius freeradius-mysql gettext bash vim && \
    rm -rf /var/lib/apt/lists/*

COPY ./config/sql.template /etc/freeradius/3.0/mods-available/sql.template

## Copy default authorize dengan custom query
COPY ./config/default.template /etc/freeradius/3.0/sites-available/default
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# CMD ["freeradius", "-X"]
