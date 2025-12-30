FROM odoo:18

USER root
RUN apt-get update && apt-get install -y netcat-openbsd
COPY odoo.conf /etc/odoo/odoo.conf

RUN mkdir -p /var/lib/odoo && chown -R odoo:odoo /var/lib/odoo

USER odoo

CMD bash -c "until nc -z \"$PGHOST\" \"$PGPORT\"; do sleep 2; done && odoo"
