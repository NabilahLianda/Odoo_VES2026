FROM odoo:18

USER root
RUN apt-get update && apt-get install -y netcat-openbsd
COPY odoo.conf /etc/odoo/odoo.conf

USER odoo
CMD bash -c "until nc -z \"$PGHOST\" 5432; do sleep 2; done && \
  odoo \
    --http-interface=0.0.0.0 \
    --http-port=${PORT} \
    --db_host=$PGHOST \
    --db_port=5432 \
    --db_user=$PGUSER \
    --db_password=$PGPASSWORD \
    -c /etc/odoo/odoo.conf"
