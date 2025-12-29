FROM odoo:18

USER root
RUN apt-get update && apt-get install -y netcat-openbsd
COPY odoo.conf /etc/odoo/odoo.conf

USER odoo
CMD bash -c "until nc -z db 5432; do sleep 2; done && \
  odoo -c /etc/odoo/odoo.conf -d odoo -i base"

