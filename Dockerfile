FROM odoo:18

USER root
RUN apt-get update && apt-get install -y netcat-openbsd
COPY odoo.conf /etc/odoo/odoo.conf
USER odoo
