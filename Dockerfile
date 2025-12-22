FROM odoo:18

USER root
RUN apt-get update && apt-get install -y netcat-openbsd
COPY odoo.conf /etc/odoo/odoo.conf

USER odoo
CMD odoo \
  --db_host=$PGHOST \
  --db_port=5432 \
  --db_user=$PGUSER \
  --db_password=$PGPASSWORD \
  --db_name=$PGDATABASE \
  -c /etc/odoo/odoo.conf
